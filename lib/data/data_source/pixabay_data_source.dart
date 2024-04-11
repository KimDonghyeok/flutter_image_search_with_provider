import 'dart:convert';

import 'package:flutter_image_search_with_provider/data/data_source/photo_data_source.dart';
import 'package:flutter_image_search_with_provider/data/dto/photo_search_result_dto.dart';
import 'package:http/http.dart' as http;

class PixabayDataSource implements PhotoDataSource {
  final _baseUrl = 'https://pixabay.com/api';
  final apiKey = '43170873-f37e577d19b4e9b1bd2ecc27b';

  @override
  Future<PhotoSearchResultDto> getPhotoSearchResult(String keywords) async {
    final http.Response response = await http
        .get(Uri.parse('$_baseUrl/?key=$apiKey&q=$keywords&image_type=photo'));

    return PhotoSearchResultDto.fromJson(jsonDecode(response.body));
  }
}
