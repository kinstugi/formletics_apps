class IsTrainerModel {
  bool isTrainer;

  IsTrainerModel({this.isTrainer});

  factory IsTrainerModel.fromJson(Map<String, dynamic> json) {
    return IsTrainerModel(
      isTrainer: json["is_trainer"] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {"is_trainer": isTrainer};
  }
}
