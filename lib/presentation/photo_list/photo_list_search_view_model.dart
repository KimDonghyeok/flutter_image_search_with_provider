import 'package:flutter/material.dart';
import 'package:flutter_image_search_with_provider/data/model/photo.dart';
import 'package:flutter_image_search_with_provider/data/repository/photo_search_result_repository.dart';

class PhotoListSearchViewModel with ChangeNotifier {
  final PhotoSearchResultRepository _photoSearchResultRepository;

  List<Photo> _photos = [];
  bool _isLoading = false;

  PhotoListSearchViewModel({
    required PhotoSearchResultRepository photoSearchResultRepository,
  }) : _photoSearchResultRepository = photoSearchResultRepository;

  List<Photo> get photos => _photos;

  get isLoading => _isLoading;

  void _changeLoadingStatus(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  void getPhotoList(String keywords) async {
    _changeLoadingStatus(true);
    await _photoSearchResultRepository.getPhotos(keywords).then((value) async {
      await Future.delayed(const Duration(seconds: 3));
      return value;
    }).then((value) => _photos = value);
    _changeLoadingStatus(false);
  }

  void resetPhotoList() {
    _photos = [];
    notifyListeners();
  }
}
