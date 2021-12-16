import 'package:equatable/equatable.dart';
import 'package:formletics/features/tabs/trainer/data/models/student_reference_photo_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_certificate_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_service_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trainer_detail_response_model.g.dart';

@JsonSerializable()
class TrainerDetailResponseModel extends Equatable {
  final int id;
  final String name;
  final String last_name;
  final String photo;
  final String location;
  final int sportsman_count;
  final String statement;
  final String specialization;
  final List<TrainerServiceResponseModel> services;
  final List<TrainerCertificateModel> certificates;
  final List<StudentReferencePhotoModel> students_photo;
  final String introductory_video;
  final String before_photo;
  final String after_photo;

  const TrainerDetailResponseModel({
    this.id,
    this.name,
    this.last_name,
    this.photo,
    this.location,
    this.sportsman_count,
    this.statement,
    this.specialization,
    this.services,
    this.certificates,
    this.introductory_video,
    this.after_photo,
    this.before_photo,
    this.students_photo
  });

  factory TrainerDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerDetailResponseModelToJson(this);

  @override
  List<Object> get props => [
    id,
    name,
    last_name,
    photo,
    location,
    sportsman_count,
    statement,
    specialization,
    services,
    before_photo,
    after_photo,
    introductory_video,
    certificates,
    students_photo
  ];
}
