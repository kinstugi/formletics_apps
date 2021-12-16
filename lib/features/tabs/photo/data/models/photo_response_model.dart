import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_response_model.g.dart';

@JsonSerializable()
class PhotoResponseModel extends Equatable {
  @JsonKey(name: 'albumId')
  final int albumId;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'thumbnailUrl')
  final String thumbnailUrl;

  const PhotoResponseModel(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory PhotoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoResponseModelToJson(this);

  @override
  List<Object> get props => [albumId, id, title, url, thumbnailUrl];
}
