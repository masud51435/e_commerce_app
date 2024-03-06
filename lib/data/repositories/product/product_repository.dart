import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../category/firebase_storage_service.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  RxBool productLoading = false.obs;

  // variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // get limited featured product
  Future<List<ProductModel>> getFeatureProduct() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      
      return snapshot.docs
          .map((document) => ProductModel.fromSnapShot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong, please try again ${e.toString()}';
    }
  }

  //upload Product to the cloud fireStore
  Future<void> uploadProductDummyData(List<ProductModel> products) async {
    try {
      productLoading.value = true;

      //upload all the product along with their image
      final storage = Get.put(AppFirebaseStorageService());

      // loop throw the each product
      for (var product in products) {
        // get image data link from local asset
        final thumbnail =
            await storage.getImageDataFromAsset(product.thumbnail);

        // upload image and get it url
        final url = await storage.uploadImageData(
            'Products/TImages', thumbnail, product.thumbnail);

        //assign attibute to product thumbnail
        product.thumbnail = url;

        //product list of image
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            // get image data link from local asset
            final assetImage = await storage.getImageDataFromAsset(image);

            // upload image and get it url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            //assign URL to product imageUrl
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }

        //upload variation image
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // get image data link from local asset
            final assetImage =
                await storage.getImageDataFromAsset(variation.image);

            // upload image and get its url
            final url = await storage.uploadImageData(
                'Products/VImages', assetImage, variation.image);

            // assign URL  to variation.image attributes
            variation.image = url;
          }
        }
        //store product in fireStore
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong, please try again ${e.toString()}';
    } finally {
      productLoading.value = false;
    }
  }
}
