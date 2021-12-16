import 'dart:io';
import 'package:dio/dio.dart';

class GymRegisterModel {
  String username;
  String email;
  String password;

  String name;
  String phone;
  String location;
  String statement;

  File vergiLevhasi;
  File imzaSirkuleri;
  File bankaBilgeri;
  File faaliyetBilgise;
  File ticaretSicilGazetesi;
  File formleticSozleme;

  File photo;
  File video;

  void setFileField(String label, File file) {
    switch (label.toLowerCase()) {
      case "vergi levhası":
        vergiLevhasi = file;
        break;
      case "banka bilgileri":
        bankaBilgeri = file;
        break;
      case "faaliyet belgesi":
        faaliyetBilgise = file;
        break;
      case "ticaret sicil gazetesi":
        ticaretSicilGazetesi = file;
        break;
      case "formletics sözleşme":
        formleticSozleme = file;
        break;
      case "photo":
        photo = file;
        break;
      default:
        imzaSirkuleri = file;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "phone": phone,
      "name": name,
      "password": password,
      "location": location,
      "statement": statement,
      // "vergiLevhasi": vergiLevhasi,
      // "imzaSirkuleri": imzaSirkuleri,
      // "bankaBilgeri": bankaBilgeri,
      // "faaliyetBilgise": faaliyetBilgise,
      // "ticaretSicilGazetesi": ticaretSicilGazetesi,
      // "formleticSozleme": formleticSozleme,
      // "passportPhoto": passportPhoto
    };
  }

  Future<FormData> formData() async {
    return FormData.fromMap({
      "username": username,
      "email": email,
      "phone": phone,
      "name": name,
      "password": password,
      "location": location,
      "statement": statement,
      "vergiLevhasi": await MultipartFile.fromFile(vergiLevhasi?.path),
      "imzaSirkuleri": await MultipartFile.fromFile(imzaSirkuleri?.path),
      "bankaBilgeri": await MultipartFile.fromFile(bankaBilgeri?.path),
      "faaliyetBilgise": await MultipartFile.fromFile(faaliyetBilgise?.path),
      "ticaretSicilGazetesi": await MultipartFile.fromFile(
        ticaretSicilGazetesi?.path,
      ),
      "formleticSozleme": await MultipartFile.fromFile(formleticSozleme?.path),
      // "video": await MultipartFile.fromFile(video?.path)
    });
  }
}
