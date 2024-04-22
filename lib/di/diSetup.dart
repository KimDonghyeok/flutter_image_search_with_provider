import 'package:flutter_image_search_with_provider/data/data_source/photo_data_source.dart';
import 'package:flutter_image_search_with_provider/data/data_source/pixabay_data_source.dart';
import 'package:flutter_image_search_with_provider/data/repository/photo_search_result_repository.dart';
import 'package:flutter_image_search_with_provider/data/repository/photo_search_result_repository_impl.dart';
import 'package:flutter_image_search_with_provider/presentation/photo_list/photo_list_search_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<PhotoDataSource>(PixabayDataSource());
  getIt.registerSingleton<PhotoSearchResultRepository>(
      PhotoSearchResultRepositoryImpl(photoDataSource: getIt()));

  getIt.registerFactory<PhotoListSearchViewModel>(
      () => PhotoListSearchViewModel(photoSearchResultRepository: getIt()));
}
