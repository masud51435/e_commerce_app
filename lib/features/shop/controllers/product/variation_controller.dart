import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  //variations
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  // select attribute and variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {}

  //check attribute stock in variation
  Set<String?> getAttributeAvailablityInVariation(List<ProductVariationModel> variations, String attributeName){} 

  // check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stack > 0 ? 'In Stock' : 'Out of Stock';
  }

  // Reset selected attribute when switching product
  void resetSelectedAttribute() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
