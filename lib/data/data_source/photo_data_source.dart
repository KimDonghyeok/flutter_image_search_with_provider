import 'package:flutter_image_search_with_provider/data/dto/photo_search_result_dto.dart';

abstract interface class PhotoDataSource {
  Future<PhotoSearchResultDto> getPhotoSearchResult(String keywords);
}
