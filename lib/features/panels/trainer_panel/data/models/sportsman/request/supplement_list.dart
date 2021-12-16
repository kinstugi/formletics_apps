import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'supplement_list.g.dart';

@JsonSerializable()
class TrainerPanelSportsmanNestedSupplementList extends Equatable {
  @JsonKey(name: 'supplement')
  final int supplement;
  @JsonKey(name: 'portion')
  final String portion;
  @JsonKey(name: 'meal')
  final String meal;

  TrainerPanelSportsmanNestedSupplementList(
      {this.supplement, this.portion, this.meal});

  factory TrainerPanelSportsmanNestedSupplementList.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerPanelSportsmanNestedSupplementListFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainerPanelSportsmanNestedSupplementListToJson(this);

  @override
  List<Object> get props => [this.supplement, this.portion, this.meal];
}
