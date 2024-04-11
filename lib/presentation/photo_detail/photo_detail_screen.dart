import 'package:flutter/material.dart';
import 'package:flutter_image_search_with_provider/data/model/photo.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이미지 상세'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
                tag: photo.id,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      photo.url,
                      fit: BoxFit.cover,
                    ))),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: photo.tags
                  .split(', ')
                  .toList()
                  .map((tag) => Text(
                        tag,
                        style: GoogleFonts.merienda(
                            textStyle: const TextStyle(fontSize: 24)),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
