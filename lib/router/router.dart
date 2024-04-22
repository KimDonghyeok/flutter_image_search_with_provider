import 'package:flutter_image_search_with_provider/data/model/photo.dart';
import 'package:flutter_image_search_with_provider/di/diSetup.dart';
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
          create: (context) => getIt<PhotoListSearchViewModel>(),
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
