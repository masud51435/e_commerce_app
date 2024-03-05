import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/category/firebase_storage_service.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();
  RxBool categoryLoading = false.obs;

// variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Get All Category
  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final documentSnapshot = await _db.collection('Categories').get();
      final list = documentSnapshot.docs
          .map((document) => CategoryModel.fromSnapShot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong, please try again';
    }
  }

  //upload catagories to the cloud fireStore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      categoryLoading.value = true;
      //upload all the categories along with the local asset
      final storage = Get.put(AppFirebaseStorageService());

      // loop throw each categories
      for (var category in categories) {
        final file = await storage.getImageDataFromAsset(category.image);

        //upload image and get its url
        final url =
            await storage.uploadImageData("Categories", file, category.name);

        //assign url to category image attribute
        category.image = url;

        // store category in fireStore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong, please try again';
    } finally {
      categoryLoading.value = false;
    }
  }
}
