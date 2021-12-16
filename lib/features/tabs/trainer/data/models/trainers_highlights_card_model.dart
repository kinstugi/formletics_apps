import 'package:json_annotation/json_annotation.dart';

part 'trainers_highlights_card_model.g.dart';

@JsonSerializable()
class TrainersHighlightCardModel{
  int id;
  String name, subtitle, photo;

  TrainersHighlightCardModel({this.id, this.photo, this.name, this.subtitle});

  factory TrainersHighlightCardModel.fromJson(Map<String, dynamic> json){
    return _$TrainersHighlightCardModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TrainersHighlightCardModelToJson(this);
  }
}