import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trainer_cut_response_model.g.dart';

@JsonSerializable()
class TrainerCutResponseModel extends Equatable {
  final int id;
  final String user;
  final String name;
  final String last_name;
  final String photo;
  final String il;
  final String ilce;
  final String semt;
  final String mahalle;
  final int sportsman_count;

  const TrainerCutResponseModel(
      {this.id,
      this.user,
      this.name,
      this.last_name,
      this.photo,
      this.il,
      this.ilce,
      this.semt,
      this.mahalle,
      this.sportsman_count});

  factory TrainerCutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerCutResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerCutResponseModelToJson(this);

  @override
  List<Object> get props => [
        id,
        user,
        name,
        last_name,
        photo,
        il,
        ilce,
        semt,
        mahalle,
        sportsman_count
      ];
}
