import 'package:dio/dio.dart';
import 'package:wallhaven/data/wallhaven_repository/image_model.dart';

import 'search_parameters.dart';

class WallhavenRepository {
  final Dio _dio = Dio();
  static const String _baseUrl = "https://wallhaven.cc/";
  static const String _apiPath = "api/v1/search";

  Future<List<ImageModel>> fetchImages(SearchParameters parameters) async {
    List<ImageModel> images = [];

    _dio.options.baseUrl = _baseUrl;
    _dio.options.queryParameters = parameters.toQueryParameters();
    var result = await _dio.get(_apiPath);

    for (var image in result.data["data"]) {
      images.add(ImageModel.fromMap(image));
    }

    return images;
  }
}
