import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wallhaven/data/unsplash_repository/unsplash_image.dart';

import 'keys.dart';

class UnsplashRepository {
  final String _baseUrl = "https://api.unsplash.com";
  final Dio _dio = Dio();

  Future<List<UnsplashImage>> getPhotos() async {
    var result = <UnsplashImage>[];
    _dio.options.baseUrl = _baseUrl;
    _dio.options.queryParameters = {
      "client_id": accessKey,
    };

    var response = await _dio.get('/photos');

    for (var map in response.data) {
      result.add(UnsplashImage.fromMap(map));
    }

    for (var element in result) {
      debugPrint(element.toString());
    }
    return result;
  }
}
