import 'package:equatable/equatable.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_cut_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trainer_list_response_model.g.dart';

@JsonSerializable()
class TrainerListResponseModel extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<TrainerCutResponseModel> results;

  const TrainerListResponseModel(
      {this.count, this.next, this.previous, this.results});

  factory TrainerListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerListResponseModelToJson(this);

  @override
  List<Object> get props => [count, next, previous, results];
}
