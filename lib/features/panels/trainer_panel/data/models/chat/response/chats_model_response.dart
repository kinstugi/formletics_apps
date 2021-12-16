class SportsmanChatResponseModel {
  int id;
  User user;
  List<Service> service;
  Trainer trainer;
  String endDate;
  String uuid;
  int status;
  String startDate;

  SportsmanChatResponseModel({
    this.id,
    this.user,
    this.service,
    this.trainer,
    this.endDate,
    this.uuid,
    this.status,
    this.startDate,
  });

  SportsmanChatResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    user = json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null;
    if (json['service'] != null) {
      service = List<Service>();
      json['service'].forEach((v) {
        service.add(Service.fromJson(v as Map<String, dynamic>));
      });
    }
    trainer = json['trainer'] != null
        ? Trainer.fromJson(json['trainer'] as Map<String, dynamic>)
        : null;
    endDate = json['end_date'] as String;
    uuid = json['uuid'] as String;
    status = json['status'] as int;
    startDate = json['start_date'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    if (user != null) {
      data['user'] = user.toJson();
    }
    if (service != null) {
      data['service'] = service.map((v) => v.toJson()).toList();
    }
    if (trainer != null) {
      data['trainer'] = trainer.toJson();
    }
    data['end_date'] = endDate;
    data['uuid'] = uuid;
    data['status'] = status;
    data['start_date'] = startDate;
    return data;
  }
}

class User {
  int id;
  String username;
  String firstName;
  String lastName;

  User({
    this.username,
    this.firstName,
    this.lastName,
    this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'] as String;
    firstName = json['first_name'] as String;
    lastName = json['last_name'] as String;
    id = json['id'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}

class Service {
  int id;
  String name;
  bool subscription;
  bool isExercise;
  bool isNutrition;
  bool isSupplement;

  Service({
    this.id,
    this.name,
    this.subscription,
    this.isExercise,
    this.isNutrition,
    this.isSupplement,
  });

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    subscription = json['subscription'] as bool;
    isExercise = json['is_exercise'] as bool;
    isNutrition = json['is_nutrition'] as bool;
    isSupplement = json['is_supplement'] as bool;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['subscription'] = subscription;
    data['is_exercise'] = isExercise;
    data['is_nutrition'] = isNutrition;
    data['is_supplement'] = isSupplement;
    return data;
  }
}

class Trainer {
  int id;
  String name;
  String lastName;
  String photo;
  String il;
  String ilce;
  String semt;
  String mahalle;
  int sportsmanCount;

  Trainer({
    this.id,
    this.name,
    this.lastName,
    this.photo,
    this.il,
    this.ilce,
    this.semt,
    this.mahalle,
    this.sportsmanCount,
  });

  Trainer.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    lastName = json['last_name'] as String;
    photo = json['photo'] as String;
    il = json['il'] as String;
    ilce = json['ilce'] as String;
    semt = json['semt'] as String;
    mahalle = json['mahalle'] as String;
    sportsmanCount = json['sportsman_count'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['photo'] = this.photo;
    data['il'] = this.il;
    data['ilce'] = this.ilce;
    data['semt'] = this.semt;
    data['mahalle'] = this.mahalle;
    data['sportsman_count'] = this.sportsmanCount;
    return data;
  }
}
