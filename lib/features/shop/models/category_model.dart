import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  // Empty helper Function
  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        image: '',
        isFeatured: false,
      );

  //convert model to JSON structure for staring data into firebase
  Map<String, dynamic> toJson() {
    return {
      'Image': image,
      'IsFeatured': isFeatured,
      'Name': name,
      'ParentId': parentId,
    };
  }

  //Factory method to create a UserModel from a Firebase document snapshot
  factory CategoryModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      //map JSON Record form Model
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        parentId: data['ParentId'] ?? '',
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
