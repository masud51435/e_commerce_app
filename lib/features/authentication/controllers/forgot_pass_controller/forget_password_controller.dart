import 'package:e_commerce_app/data/repositories/authentication/authentication_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../common/widgets/network_manager/network_managers.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/popup/full_screen_loader.dart';
import '../../screens/forgot_password/verify_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

/// [MailSend] for reset your password
  Future<void> sendMail() async {
    try {
      //start loading
      AppFullScreenLoader.openLoadingDialog(
        'Processing your data...',
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

      // send the mail
      await AuthenticationRepository.instance.sendPasswordResetMail(
        emailController.text.trim(),
      );

      //remove loader
      AppFullScreenLoader.offLoading();

      //success message
      AppLoaders.successSnackBar(
        title: 'Email Send',
        message: 'Please check your Email and reset your Password',
      );

      //redirect to new screen
      Get.to(
        () => PasswordVerify(
          email: emailController.text.trim(),
        ),
      );
    } catch (e) {
      AppFullScreenLoader.offLoading();
      AppLoaders.errorSnackBar(
        title: 'Oh snap!',
        message: e.toString(),
      );
    }
  }

/// [ResendMail] resend the mail if mail not send
  Future<void> reSendMail() async {
    try {
      //start loading
      AppFullScreenLoader.openLoadingDialog(
        'Processing your data...',
        AppImages.signUploading,
      );

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.offLoading();
        return;
      }

      // send the mail
      await AuthenticationRepository.instance.sendPasswordResetMail(
        emailController.text.trim(),
      );

      //remove loader
      AppFullScreenLoader.offLoading();

      //success message
      AppLoaders.successSnackBar(
        title: 'Email Resend',
        message: 'Please check your Email and reset your Password',
      );
    } catch (e) {
      AppFullScreenLoader.offLoading();
      AppLoaders.errorSnackBar(
        title: 'Oh snap!',
        message: e.toString(),
      );
    }
  }
}
