
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/category/firebase_storage_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/banner_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

    /// Get All Banners
  Future<List<BannerModel>> getAllBanner() async {
    try {
      final documentSnapshot = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      final list = documentSnapshot.docs
          .map((document) => BannerModel.fromSnapShot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong $e, please try again ';
    }
  }

  //upload Banners to the cloud fireStore
  Future<void> uploadBannerData(List<BannerModel> banners) async {
    try {
      //upload all the categories along with the local asset
      final storage = Get.put(AppFirebaseStorageService());

      // loop throw each categories
      for (var banner in banners) {
        final file = await storage.getImageDataFromAsset(banner.imageUrl);

        //upload image to firebase Storage and get its url
        final url = await storage.uploadImageData(
          'Banners',
          file,
          DateTime.now().millisecondsSinceEpoch.toString(),
        );

        //assign url to Banners image attribute
        banner.imageUrl = url;

        // store category in fireStore
        await _db.collection('Banners').add(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong $e, please try again ';
    }
  }
}
