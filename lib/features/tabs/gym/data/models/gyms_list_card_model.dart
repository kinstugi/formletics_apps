import 'package:json_annotation/json_annotation.dart';

part 'gyms_list_card_model.g.dart';

@JsonSerializable()
class GymListCardModel {
  int id;
  String name, photo, il, ilce, semt, mahalle;

  GymListCardModel(
      {this.id, this.il, this.ilce, this.mahalle, this.name, this.photo, this.semt});

  factory GymListCardModel.fromJson(Map<String, dynamic> json) {
    return _$GymListCardModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GymListCardModelToJson(this);
  }
}
