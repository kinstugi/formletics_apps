class Payment3DResponseModel {
  String status;
  String body;

  Payment3DResponseModel({this.status, this.body});

  factory Payment3DResponseModel.fromJson(Map<String, dynamic> data) {
    return Payment3DResponseModel(
      status: data['status'] as String,
      body: data['body'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'body': body,
    };
  }
}