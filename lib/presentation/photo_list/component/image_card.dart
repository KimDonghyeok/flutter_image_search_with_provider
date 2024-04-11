import 'package:flutter/material.dart';
import 'package:flutter_image_search_with_provider/data/model/photo.dart';
import 'package:go_router/go_router.dart';

class ImageCard extends StatelessWidget {
  final Photo photo;

  const ImageCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: photo.id,
      child: GestureDetector(
        onTap: () {
          context.push('/details', extra: photo);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(photo.url, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
