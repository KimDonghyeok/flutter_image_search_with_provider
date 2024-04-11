import 'package:flutter_image_search_with_provider/data/data_source/pixabay_data_source.dart';
import 'package:flutter_image_search_with_provider/data/model/photo.dart';
import 'package:flutter_image_search_with_provider/data/repository/photo_search_result_repository_impl.dart';
import 'package:flutter_image_search_with_provider/presentation/photo_detail/photo_detail_screen.dart';
import 'package:flutter_image_search_with_provider/presentation/photo_list/photo_list_search_screen.dart';
import 'package:flutter_image_search_with_provider/presentation/photo_list/photo_list_search_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => PhotoListSearchViewModel(
            photoSearchResultRepository: PhotoSearchResultRepositoryImpl(
              photoDataSource: PixabayDataSource(),
            ),
          ),
          child: const PhotoListScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) {
            final photo = state.extra as Photo;

            return PhotoDetailScreen(photo: photo);
          },
        )
      ],
    ),
  ],
);
