import 'package:flutter_image_search_with_provider/data/dto/photo_search_result_dto.dart';
import 'package:flutter_image_search_with_provider/data/model/photo.dart';

extension ToPhoto on Hit {
  Photo toPhoto() {
    return Photo(
      id: id!.toInt(),
      url: webformatURL ?? '',
      tags: tags ?? '',
    );
  }
}
