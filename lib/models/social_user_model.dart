import 'dart:convert';

class SocialUserModel {
  String name;
  String email;
  String phone;
  String uId;
  String image;
  String bio;
  bool isEmailVerified;

  SocialUserModel(
      {this.name,
      this.email,
      this.phone,
      this.uId,
      this.image,
      this.bio,
      this.isEmailVerified});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'image': image,
       'bio':bio,
      'isEmailVerified': isEmailVerified
    };
  }
}
