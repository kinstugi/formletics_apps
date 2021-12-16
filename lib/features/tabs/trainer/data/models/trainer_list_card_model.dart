import 'package:flutter/foundation.dart';
class TrainerListCardModel{
  final int id;
  final String name;
  final String photo;

  TrainerListCardModel({
    @required this.id,
    @required this.name,
    @required this.photo
  });

  factory TrainerListCardModel.fromJson(Map<String, dynamic> json){
    return TrainerListCardModel(
      id: json["id"] as int,
      name: json["name"] as String,
      photo: json["photo"] as String,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id" : id,
      "name": name,
      "photo": photo,
    };
  }
}