import 'package:cloud_firestore/cloud_firestore.dart';

import 'brand_model.dart';
import 'product_attibute_model.dart';
import 'product_variation_model.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.stock,
    required this.price,
    required this.title,
    required this.productType,
    required this.thumbnail,
    this.sku,
    this.date,
    this.isFeatured,
    this.salePrice = 0.0,
    this.brand,
    this.categoryId,
    this.description,
    this.images,
    this.productAttributes,
    this.productVariations,
  });

  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  // create empty function for clean code
  static ProductModel empty() => ProductModel(
        id: '',
        stock: 0,
        price: 0,
        title: '',
        productType: '',
        thumbnail: '',
      );

  /// to json
  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'DateTime': date,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  //map json oriented document from firebase to UserModel
  factory ProductModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    if (document.data() == null) {
      return ProductModel.empty();
    }
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      title: data['Title'],
      productType: data['ProductType'] ?? '',
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
