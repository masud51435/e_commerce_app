
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/exceptions/platform_exceptions.dart';

class AppFirebaseStorageService extends GetxController {
  static AppFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAsset(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error leading image data: ${e.toString()}';
    }
  }

  //upload image using imageData on cloud firebase Storage
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is AppPlatformException) {
        throw 'Platform Exception: ${e.message}';
      }else{
         throw 'Some thing went wrong, please try again ${e.toString()}';
      }
      
    }
  }

  //upload image using imageData on cloud firebase Storage
  Future<String> uploadImageFile(
      String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is AppPlatformException) {
        throw 'Platform Exception: ${e.message}';
      }else{
         throw 'Some thing went wrong, please try again ${e.toString()}';
      }
      
    }
  }
}
