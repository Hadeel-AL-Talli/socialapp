import 'dart:convert';

class PostModel {
  String name;

  String uId;
  String image;
  String dateTime;
  String text;
  String postImage;

  PostModel(
      {this.name,
      this.uId,
      this.image,
      this.dateTime,
      this.postImage,
      this.text});

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dateTime = json['dateTime'];
    uId = json['uId'];
    image = json['image'];
    text = json['text'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'postImage':postImage,
      'text':text,
      'dateTime':dateTime

    };
  }
}
