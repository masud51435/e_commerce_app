import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/formatters/formatter.dart';

class UserModel {
  UserModel({
    required this.userName,
    required this.email,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  //Helper function to get full name
  String get fullName => '$firstName $lastName';

  //Helper function to get Phone Number
  String get formatPhoneNo => AppFormatter.formatPhoneNumber(phoneNumber);

  //static function to split full name into first name and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseSureName = "$firstName $lastName";
    String userNameWithPrefix = camelCaseSureName;
    return userNameWithPrefix;
  }

  //static function to create on empty user model
  static UserModel empty() => UserModel(
        userName: '',
        email: '',
        id: '',
        firstName: '',
        lastName: '',
        phoneNumber: '',
        profilePicture: '',
      );

  //convert model to JSON structure for staring data into firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePic': profilePicture,
    };
  }

  //Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.formSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        userName: data['UserName'] ?? "",
        email: data['Email'] ?? '',
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePic'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
