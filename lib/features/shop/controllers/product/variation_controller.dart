import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
      ProductModel product, attributeName, attributeValue) {
    //when attribute is selected we will first add that attribute  to the selectedAttribute
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;
  }

  // check if selected attributes matches any variation attributes
  // bool _isSelectedAttributeValue(Map<String, dynamic> variationAttributes,
  //     Map<String, dynamic> selectedAttributes) {
  //   //if selectedAttributes contains 3 attributes and current variation contains 2 then return
  //   if (variationAttributes.length != selectedAttributes.length) return false;
  //   // if any of the attributes is different than returns.e.g. [Green , Large] * [Green, Small]
  //   for (final key in variationAttributes.keys) {
  //     //attribute[key] = Value which could be [Green, Small, Cotton]
  //     if (variationAttributes[key] != selectedAttributes[key]) return false;
  //   }
  // }

  //check attribute stock in variation
  // Set<String?> getAttributeAvailablityInVariation(
  //     List<ProductVariationModel> variations, String attributeName) {}

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
