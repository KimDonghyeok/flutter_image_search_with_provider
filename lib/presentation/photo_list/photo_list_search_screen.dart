import 'package:flutter/material.dart';
import 'package:flutter_image_search_with_provider/presentation/photo_list/component/image_card.dart';
import 'package:flutter_image_search_with_provider/presentation/photo_list/photo_list_search_view_model.dart';
import 'package:provider/provider.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  final _searchTextEditingController = TextEditingController();

  @override
  void dispose() {
    _searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PhotoListSearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색'),
        actions: [
          IconButton(
              onPressed: () {
                viewModel.resetPhotoList();
                _searchTextEditingController.text = '';
              },
              icon: const Icon(Icons.delete_forever_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _searchTextEditingController,
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (value) {
                viewModel.getPhotoList(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '검색어',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const Divider(),
            Expanded(
              child: viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : viewModel.photos.isEmpty
                      ? const Center(child: Text('검색 결과가 없습니다.'))
                      : GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          children: viewModel.photos
                              .map((photo) => ImageCard(photo: photo))
                              .toList(),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
