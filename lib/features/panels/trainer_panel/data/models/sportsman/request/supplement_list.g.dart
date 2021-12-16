// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta

part of 'supplement_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerPanelSportsmanNestedSupplementList
    _$TrainerPanelSportsmanNestedSupplementListFromJson(
        Map<String, dynamic> json) {
  return TrainerPanelSportsmanNestedSupplementList(
    supplement: json['supplement'] as int,
    portion: json['portion'] as String,
    meal: json['meal'] as String,
  );
}

Map<String, dynamic> _$TrainerPanelSportsmanNestedSupplementListToJson(
        TrainerPanelSportsmanNestedSupplementList instance) =>
    <String, dynamic>{
      'supplement': instance.supplement,
      'portion': instance.portion,
      'meal': instance.meal,
    };
