import 'package:e_commerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_commerce_app/common/widgets/network_manager/network_managers.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repo.dart';
import 'package:e_commerce_app/data/repositories/user/user_model.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/verify_mail/verifyMail.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/popup/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool toggle = true.obs;
  RxBool loading = false.obs;
  RxBool privacyController = false.obs;

  setToggle() {
    toggle.value = !toggle.value;
  }

  setPrivacyController() {
    privacyController.value = !privacyController.value;
  }

  setLoading(bool value) {
    loading.value = value;
  }

  void signUp() async {
    try {
      //start loading
      AppFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        AppImages.signUploading,
      );

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.offLoading();
        return;
      }

      //form validation
      if (!formKey.currentState!.validate()) {
        AppFullScreenLoader.offLoading();
        return;
      }

      //privacy Policy
      if (!privacyController.value) {
        AppLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use',
        );
      }

      //Register user with email & password
      final userCredential =
          await AuthenticationRepository.instance.signUpWithEmailPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      //get the data from text field
      final newUser = UserModel(
        userName: userNameController.text.trim(),
        email: emailController.text.trim(),
        id: userCredential.user!.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        profilePicture: '',
      );

      // get the data from usermodel and save into fireStore
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //remove loader
      AppFullScreenLoader.offLoading();

      // show the success message
      AppLoaders.successSnackBar(
        title: 'Congratulations',
        message:
            'Your account create successfully, verify your email to continue',
      );

      // Redirect to the new screen
      Get.to(
        () => VerifyMail(
          email: emailController.text.trim(),
        ),
      );
    } catch (e) {
      AppFullScreenLoader.offLoading();

      AppLoaders.errorSnackBar(
        title: 'oh snap!',
        message: e.toString(),
      );
    }
  }
}
