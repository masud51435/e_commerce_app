import 'package:e_commerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_data_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/network_manager/network_managers.dart';
import '../../../utils/constants/image_string.dart';
import '../../../utils/popup/full_screen_loader.dart';

class record extends GetxController {
  static record get instance => Get.find();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    // TODO: implement onInit
    initializeName();
    super.onInit();
  }

  // Fetch user record
  Future<void> initializeName() async {
    firstNameController.text = userController.user.value.firstName;
    lastNameController.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
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

      //update the first name and last name into firebase fireStore
      Map<String, dynamic> name = {
        'FirstName': firstNameController.text.trim(),
        'LastName': lastNameController.text.trim(),
      };
      await userRepository.updateSingleField(name);

      //update the Rx UserController user value
      userController.user.value.firstName = firstNameController.text.trim();
      userController.user.value.lastName = lastNameController.text.trim();

      //remove Loading
      AppFullScreenLoader.offLoading();

      //show success message
      AppLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your name has been updated');

      //Move to Previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      AppFullScreenLoader.offLoading();
      AppLoaders.errorSnackBar(
        title: 'Oh snap!',
        message: e.toString(),
      );
    }
  }
}
