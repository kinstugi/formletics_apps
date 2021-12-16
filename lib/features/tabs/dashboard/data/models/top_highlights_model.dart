import 'package:flutter/foundation.dart';

class TopHighlightModel{
  final int id;
  final String title;
  final String subtitle;
  final String photo;

  TopHighlightModel({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    this.photo
  });

  factory TopHighlightModel.fromJson(Map<String, dynamic> json){
    return TopHighlightModel(
      id: json['id'] as int,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      photo: json['photo'] as String
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "title": title,
      "subtitle": subtitle,
      "photo": photo
    };
  }
}