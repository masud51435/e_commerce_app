import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  BannerModel({
    required this.imageUrl,
    required this.active,
    required this.targetScreen,
  });

  String imageUrl;
  final String targetScreen;
  final bool active;

  // Empty helper Function
  static BannerModel empty() => BannerModel(
        imageUrl: '',
        active: false,
        targetScreen: '',
      );

  //convert model to JSON structure for storing data into firebase
  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  //Factory method to create a UserModel from a Firebase document snapshot
  factory BannerModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return BannerModel(
        imageUrl: data['ImageUrl'] ?? '',
        active: data['Active'] ?? false,
        targetScreen: data['TargetScreen'] ?? '',
      );
    } else {
      return BannerModel.empty();
    }
  }
}
