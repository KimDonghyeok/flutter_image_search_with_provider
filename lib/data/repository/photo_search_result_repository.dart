import 'package:flutter_image_search_with_provider/data/model/photo.dart';

abstract interface class PhotoSearchResultRepository {
  Future<List<Photo>> getPhotos(String keywords);
}
