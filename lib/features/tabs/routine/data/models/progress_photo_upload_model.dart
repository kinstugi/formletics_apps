import 'package:multi_image_picker/multi_image_picker.dart';

class ProgressPhotoUploadModel {
  List<Asset> images;
  String height;
  String weight;
  String bodyFat;
  String biceps;
  String triceps;
  String chest;
  String shoulder;
  String bloodType;
  int service;

  ProgressPhotoUploadModel({
    this.biceps,
    this.bloodType,
    this.bodyFat,
    this.chest,
    this.height,
    this.images = const [],
    this.shoulder,
    this.triceps,
    this.weight,
    this.service,
  });

  Map<String, String> toJson() {
    return {
      'biceps': biceps ?? "",
      'triceps': triceps ?? "",
      'chest': chest ?? "",
      'bloodType': bloodType ?? "",
      'height': height ?? "",
      'weight': weight ?? "",
      'body_fat': bodyFat ?? "",
      'shoulder': shoulder ?? "",
    };
  }
}
