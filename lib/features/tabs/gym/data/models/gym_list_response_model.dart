import 'package:equatable/equatable.dart';
import 'package:formletics/features/tabs/gym/data/models/gym_cut_reponse_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gym_list_response_model.g.dart';

@JsonSerializable()
class GymListResponseModel extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<GymCutResponseModel> results;

  const GymListResponseModel(
      {this.count, this.next, this.previous, this.results});

  factory GymListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GymListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GymListResponseModelToJson(this);

  @override
  List<Object> get props => [count, next, previous, results];
}
