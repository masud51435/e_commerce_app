import 'package:e_commerce_app/data/repositories/authentication/authentication_repo.dart';
import 'package:e_commerce_app/data/repositories/user/user_model.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/re_authenticate_user_login.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/popup/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../common/widgets/network_manager/network_managers.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_string.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  // here we store the data who login with google authentication
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;
  RxBool imageUploading = false.obs;

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  RxBool toggle = true.obs;

  setToggle() {
    toggle.value = !toggle.value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      //refresh user record
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName =
              UserModel.generateUserName(userCredential.user!.displayName);

          // get the data from the user
          final user = UserModel(
            userName: userName,
            email: userCredential.user!.email ?? '',
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(0).join(' ') : '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          // get the data from userModel and save into fireStore
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      AppLoaders.errorSnackBar(
        title: 'Data not saved',
        message: e.toString(),
      );
    }
  }

  // LogOut account popup
  void logOutAccountPopUp() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppSizes.md),
      title: 'LogOut Now',
      middleText: 'Are you sure you want to logOut from your account now?',
      confirm: ElevatedButton(
        onPressed: () async => AuthenticationRepository.instance.logOut(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(
            color: Colors.red,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child: Text('LogOut'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: const Text('Cancel'),
      ),
    );
  }

  // Delete account popup
  void deleteAccountPopUp() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be remove permanently',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(
            color: Colors.red,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: const Text('Cancel'),
      ),
    );
  }

  // Delete User Account
  void deleteUserAccount() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
        'Processing',
        AppImages.signUploading,
      );

      //first reAuthenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Re verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteUserAccount();
          AppFullScreenLoader.offLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          AppFullScreenLoader.offLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      AppFullScreenLoader.offLoading();
      AppLoaders.warningSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }

  //Re authenticate before delete
  Future<void> reAuthEmailPassword() async {
    try {
      //start loading
      AppFullScreenLoader.openLoadingDialog(
        'Processing',
        AppImages.signUploading,
      );

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.offLoading();
        return;
      }

      //form validation
      if (!reAuthFormKey.currentState!.validate()) {
        AppFullScreenLoader.offLoading();
        return;
      }
      AuthenticationRepository.instance.reAuthenticateWithEmailPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      AuthenticationRepository.instance.deleteUserAccount();

      AppFullScreenLoader.offLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      AppFullScreenLoader.offLoading();
      AppLoaders.warningSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }

  // upload profile image
  Future<void> uploadProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageUploading.value = true;
        //upload image
        final imageUrl =
            await userRepository.uploadImage('Users/images/profile/', image);

        //upload user image data
        Map<String, dynamic> json = {'ProfilePic': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        AppLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your profile image has been uploaded');
      }
    } catch (e) {
      AppLoaders.errorSnackBar(
        title: 'Oh snap!',
        message: "something went wrong ${e.toString()}",
      );
    } finally {
      imageUploading.value = false;
    }
  }
}
