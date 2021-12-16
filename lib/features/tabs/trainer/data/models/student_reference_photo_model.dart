class StudentReferencePhotoModel{
  final String beforeImage;
  final String afterImage;

  StudentReferencePhotoModel({
    this.afterImage,
    this.beforeImage
  });

  factory StudentReferencePhotoModel.fromJson(Map<String, dynamic> json){
    return StudentReferencePhotoModel(
      afterImage: json['after_image'] as String,
      beforeImage: json['before_image'] as String
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'after_image': afterImage,
      'before_image': beforeImage
    };
  }
}