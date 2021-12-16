class ServiceResponseModel {
  int id;
  Trainer trainer;
  String name;
  int months;
  String startDate;
  String endDate;

  ServiceResponseModel({
    this.id,
    this.trainer,
    this.name,
    this.months,
    this.endDate,
    this.startDate,
  });

  ServiceResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    months = json['months'] as int;
    endDate = json['end_date'] as String;
    startDate = json['start_date'] as String;
    trainer = json['trainer'] != null
        ? Trainer.fromJson(json['trainer'] as Map<String, dynamic>)
        : null;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.trainer != null) {
      data['trainer'] = this.trainer.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Trainer {
  int id;
  String name;
  String lastName;
  String photo;

  Trainer({this.id, this.name, this.lastName, this.photo});

  Trainer.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    lastName = json['last_name'] as String;
    photo = json['photo'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['photo'] = this.photo;
    return data;
  }
}
