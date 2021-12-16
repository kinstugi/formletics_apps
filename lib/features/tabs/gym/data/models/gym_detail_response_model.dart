import 'package:equatable/equatable.dart';
import 'package:formletics/features/tabs/gym/data/models/gym_image_response_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_cut_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gym_detail_response_model.g.dart';

@JsonSerializable()
class GymDetailResponseModel extends Equatable {
  final int id;
  final List<TrainerCutResponseModel> trainers;
  final String location;
  final String name;
  final String photo;
  final String address;
  final String introductory_video;
  final String statement;
  final List<GymImageResponseModel> images;

  const GymDetailResponseModel({
    this.id,
    this.trainers,
    this.location,
    this.name,
    this.photo,
    this.address,
    this.statement,
    this.images,
    this.introductory_video
  });

  factory GymDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GymDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GymDetailResponseModelToJson(this);

  @override
  List<Object> get props => [
    id,
    trainers,
    location,
    name,
    photo,
    address,
    statement,
    images,
    introductory_video
  ];
}
