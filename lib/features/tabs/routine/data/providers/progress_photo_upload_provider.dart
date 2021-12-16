import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:formletics/constants/shared_preferences_keys.dart';
import 'package:http/http.dart' as http;
import 'package:formletics/constants/urls.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:formletics/features/tabs/routine/data/models/progress_photo_upload_model.dart';

class ProgressPhotoUploadProvider extends ChangeNotifier {
  final String _baseUrl = UrlConstants.DEV_API_BASE_URL;

  ProgressPhotoUploadModel progressPhotoUploadModel;

  Future<void> uploadProgressDetailToTrainer(
      ProgressPhotoUploadModel data) async {
    const targetEndpoint = 'en/api/sportsman/upload-progress-photo/';
    final uri = Uri.parse('$_baseUrl$targetEndpoint');
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);

    print('$_baseUrl$targetEndpoint');

    final _images = data.images.map((e) async {
      final ByteData byteData = await e.getByteData();
      final List<int> imageData = byteData.buffer.asUint8List();
      final ext = e.name.split('.')[1];
      return http.MultipartFile.fromBytes(
        'photos',
        imageData,
        filename: e.name,
        contentType: MediaType("image", ext),
      );
    }).toList();

    String _token = '';
    return _getToken().then((token) {
      _token = token;
      return Future.wait(_images);
    }).then((uploadImages) {
      request.headers.addAll({"Authorization": "Token $_token"});
      request.fields['service'] = data.service.toString();

      request.files.addAll(uploadImages);

      request.fields.addAll(data.toJson());

      return request.send();
    }).then((value) {
      if (value.statusCode != 201) {
        throw Exception(value.stream.bytesToString());
      }
      notifyListeners();
    }).catchError((onError) {
      throw Exception(onError.toString());
    });
  }

  Future<String> _getToken() async {
    final _pref = await SharedPreferences.getInstance();
    final token = _pref.getString(SharedPreferencesKeys.AUTH_TOKEN);
    if (token == null) throw Exception("Token does not exist");
    final tokenJson = json.decode(token);
    return tokenJson['token'] as String;
  }
}
