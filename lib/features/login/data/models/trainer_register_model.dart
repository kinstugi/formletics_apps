import 'dart:io';
import 'package:dio/dio.dart';

class TrainerRegisterModel {
  String username;
  String email;
  String phone;
  String firstName;
  String lastName;
  String password;
  String companyType;
  String specialization;
  String professionalStatement;

  File vergiLevhasi;
  File imzaSirkuleri;
  File bankaBilgeri;
  File faaliyetBilgise;
  File ticaretSicilGazetesi;
  File formleticSozleme;
  File passportPhoto;

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
      case "passport photo":
        passportPhoto = file;
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
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
      "companyType": companyType,
      "specialization": specialization,
      "professionalStatement": professionalStatement,
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
    print("*********************************");
    print(vergiLevhasi.path);
    print(imzaSirkuleri.path);
    print(bankaBilgeri.path);
    print(faaliyetBilgise.path);
    print(ticaretSicilGazetesi.path);
    print(formleticSozleme.path);
    print(passportPhoto.path);
    print("*********************************");

    return FormData.fromMap({
      "username": username,
      "email": email,
      "phone": phone,
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
      "companyType": companyType,
      "specialization": specialization,
      "professionalStatement": professionalStatement,
      "vergiLevhasi": await MultipartFile.fromFile(vergiLevhasi.path),
      "imzaSirkuleri": await MultipartFile.fromFile(imzaSirkuleri.path),
      "bankaBilgeri": await MultipartFile.fromFile(bankaBilgeri.path),
      "faaliyetBilgise": await MultipartFile.fromFile(faaliyetBilgise.path),
      "ticaretSicilGazetesi": await MultipartFile.fromFile(
        ticaretSicilGazetesi.path,
      ),
      "formleticSozleme": await MultipartFile.fromFile(formleticSozleme.path),
      "passportPhoto": await MultipartFile.fromFile(passportPhoto.path)
    });
  }
}
