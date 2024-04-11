import 'package:flutter_image_search_with_provider/data/data_source/photo_data_source.dart';
import 'package:flutter_image_search_with_provider/data/mapper/photo_mappper.dart';
import 'package:flutter_image_search_with_provider/data/model/photo.dart';
import 'package:flutter_image_search_with_provider/data/repository/photo_search_result_repository.dart';

class PhotoSearchResultRepositoryImpl implements PhotoSearchResultRepository {
  final PhotoDataSource photoDataSource;

  const PhotoSearchResultRepositoryImpl({
    required this.photoDataSource,
  });

  @override
  Future<List<Photo>> getPhotos(String keywords) async {
    final photoSearchResult =
        await photoDataSource.getPhotoSearchResult(keywords);

    if (photoSearchResult.hits == null) {
      return [];
    }

    final photos = photoSearchResult.hits;

    return photos!.map((photo) => photo.toPhoto()).toList();
  }
}
