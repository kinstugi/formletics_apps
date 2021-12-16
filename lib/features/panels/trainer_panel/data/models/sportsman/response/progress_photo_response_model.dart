class ProgressPhotoUploadResponseModel {
  int id;
  Service service;
  List<Photos> photos;
  String created;
  double biceps;
  double triceps;
  double chest;
  double shoulder;
  double weight;
  double height;
  double bodyFat;
  bool isExpanded = false;

  ProgressPhotoUploadResponseModel({
    this.id,
    this.service,
    this.photos,
    this.created,
    this.biceps,
    this.triceps,
    this.chest,
    this.shoulder,
    this.weight,
    this.height,
    this.bodyFat,
  });

  ProgressPhotoUploadResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    service = json['service'] != null
        ? Service.fromJson(json['service'] as Map<String, dynamic>)
        : null;
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos.add(Photos.fromJson(v as Map<String, dynamic>));
      });
    }
    created = json['created'] as String;
    biceps = json['biceps'] as double;
    triceps = json['triceps'] as double;
    chest = json['chest'] as double;
    shoulder = json['shoulder'] as double;
    weight = json['weight'] as double;
    height = json['height'] as double;
    bodyFat = json['body_fat'] as double;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (service != null) {
      data['service'] = service.toJson();
    }
    if (photos != null) {
      data['photos'] = photos.map((v) => v.toJson()).toList();
    }
    data['created'] = created;
    data['biceps'] = biceps;
    data['triceps'] = triceps;
    data['chest'] = chest;
    data['shoulder'] = shoulder;
    data['weight'] = weight;
    data['height'] = height;
    data['body_fat'] = bodyFat;
    return data;
  }
}

class Service {
  int id;
  Trainer trainer;
  String name;

  Service({this.id, this.trainer, this.name});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    trainer = json['trainer'] != null
        ? Trainer.fromJson(json['trainer'] as Map<String, dynamic>)
        : null;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (trainer != null) {
      data['trainer'] = trainer.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class Trainer {
  int id;
  String name;
  String lastName;
  String photo;

  Trainer({
    this.id,
    this.name,
    this.lastName,
    this.photo,
  });

  Trainer.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    lastName = json['last_name'] as String;
    photo = json['photo'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['last_name'] = lastName;
    data['photo'] = photo;
    return data;
  }
}

class Photos {
  String image;

  Photos({this.image});

  Photos.fromJson(Map<String, dynamic> json) {
    image = json['image'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}
