
import 'package:formletics/features/tabs/gym/data/models/gyms_list_card_model.dart';
import 'package:formletics/features/tabs/trainer/data/models/trainer_list_card_model.dart';

class SearchResponseModel{
  List<GymListCardModel> gyms = [];
  List<TrainerListCardModel> trainers = [];

  SearchResponseModel({this.gyms, this.trainers});

  SearchResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['gyms'] != null) {
      json['gyms'].forEach((v) {
        gyms.add(GymListCardModel.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['trainers'] != null) {
      json['trainers'].forEach((v) {
        trainers.add(TrainerListCardModel.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (gyms != null) {
      data['gyms'] = gyms.map((v) => v.toJson()).toList();
    }
    if (trainers != null) {
      data['trainers'] = trainers.map((v) => v.toJson()).toList();
    }
    return data;
  }

}