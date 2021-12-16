class TrainerCertificateModel{
  final String certName;
  final String description;

  TrainerCertificateModel({
    this.description,
    this.certName
  });

  factory TrainerCertificateModel.fromJson(Map<String, dynamic> json){
    return TrainerCertificateModel(
      certName: json['cert_name'] as String,
      description: json['description'] as String
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "cert_name": certName,
      "description": description
    };
  }
}