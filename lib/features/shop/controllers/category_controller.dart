import 'package:e_commerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_commerce_app/data/repositories/category/category_repository.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  RxBool categoryLoading = false.obs;
  RxList<CategoryModel> allCategory = <CategoryModel>[].obs;
  RxList<CategoryModel> featureCategory = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

// Load Category Data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading Categories
      categoryLoading.value = true;

      //fetch categories from the data source fireStore
      final categories = await _categoryRepository.getAllCategory();

      // update the allCategory
      allCategory.assignAll(categories);

      //filter the single category into featureCategory
      featureCategory.assignAll(
        allCategory
            .where(
              (category) => category.isFeatured && category.parentId.isEmpty,
            )
            .take(8)
            .toList(),
      );
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    } finally {
      categoryLoading.value = false;
    }
  }
}
