class ServiceDeleteResponse{
  final String statusCode;
  final String message;

  ServiceDeleteResponse({
    this.message,
    this.statusCode
  });

  factory ServiceDeleteResponse.fromJson(Map<String, dynamic> json){
    return ServiceDeleteResponse(
      message: json["Message"] as String,
      statusCode: json["statusCode"] as String
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "Message": message,
      "statusCode": statusCode
    };
  }
}