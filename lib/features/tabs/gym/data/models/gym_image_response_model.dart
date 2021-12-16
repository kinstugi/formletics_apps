class GymImageResponseModel {
  String image;

  GymImageResponseModel({this.image});

  factory GymImageResponseModel.fromJson(Map<String, dynamic> json){
    return GymImageResponseModel(image: json['image'] as String);
  }

  Map<String, dynamic> toJson(){
    return {'image': image};
  }
}