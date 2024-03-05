import 'package:e_commerce_app/features/personalization/controllers/user_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../common/widgets/network_manager/network_managers.dart';
import '../../../../data/repositories/authentication/authentication_repo.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/popup/full_screen_loader.dart';

class LogInController extends GetxController {
  static LogInController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final localStorage = GetStorage();
  final UserController controller = Get.put(UserController());

  RxBool toggle = true.obs;
  RxBool rememberMeController = false.obs;

  setToggle() {
    toggle.value = !toggle.value;
  }

  setRememberMeController() {
    rememberMeController.value = !rememberMeController.value;
  }

  @override
  void onInit() {
    emailController.text = localStorage.read('remember_my_email') ?? '';
    passwordController.text = localStorage.read('remember_my_password') ?? '';

    super.onInit();
  }

  void logIn() async {
    try {
      //start loading
      AppFullScreenLoader.openLoadingDialog(
        'Loading to LogIn...',
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

      //save the data if remember is true
      if (rememberMeController.value) {
        localStorage.write(
          'remember_my_email',
          emailController.text.trim(),
        );
        localStorage.write(
          'remember_my_password',
          passwordController.text.trim(),
        );
      }

      //LogIn user with email & password
      await AuthenticationRepository.instance.logInWithEmailPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      //remove loader
      AppFullScreenLoader.offLoading();

      // // show the success message
      // AppLoaders.successSnackBar(
      //   title: 'Congratulations',
      //   message: 'WelCome Back',
      // );

      //redirect to new screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AppFullScreenLoader.offLoading();
      AppLoaders.errorSnackBar(
        title: 'oh snap!',
        message: e.toString(),
      );
    }
  }

  //Google SignIn
  Future<void> googleSignIn() async {
    try {
      //start loading
      AppFullScreenLoader.openLoadingDialog(
        'Loading to LogIn...',
        AppImages.signUploading,
      );

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.offLoading();
        return;
      }

      //login user with google
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user data
      await controller.saveUserRecord(userCredential);

      //remove loader
      AppFullScreenLoader.offLoading();

      // // show the success message
      // AppLoaders.successSnackBar(
      //   title: 'Congratulations',
      //   message: 'WelCome Back',
      // );

      //redirect to new screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AppFullScreenLoader.offLoading();

      AppLoaders.errorSnackBar(
        title: 'oh snap!',
        message: e.toString(),
      );
    }
  }
}
