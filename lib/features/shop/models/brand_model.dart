import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured,
    this.productCount,
  });
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  // Empty helper function
  static BrandModel empty() => BrandModel(
        id: '',
        image: '',
        name: '',
      );

  // convert model to Json structure so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductCount': productCount,
      'IsFeatured': isFeatured,
    };
  }

  //map json oriented document from firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      image: data['Image'] ?? '',
      name: data['Name'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productCount: data['ProductCount'] ?? 0,
    );
  }

  //map json oriented document snapshot from firebase to UserModel
  factory BrandModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
        id: data['Id'] ?? '',
        image: data['Image'] ?? '',
        name: data['Name'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productCount: data['ProductCount'] ?? '',
      );
    } else {
      return BrandModel.empty();
    }
  }
}
