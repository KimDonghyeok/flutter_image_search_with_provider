import 'package:flutter/material.dart';
import 'package:flutter_image_search_with_provider/data/model/photo.dart';
import 'package:flutter_image_search_with_provider/data/repository/photo_search_result_repository.dart';

class PhotoListSearchViewModel with ChangeNotifier {
  final PhotoSearchResultRepository _photoSearchResultRepository;

  List<Photo> _photos = [];
  late bool _isLoading;

  PhotoListSearchViewModel({
    required PhotoSearchResultRepository photoSearchResultRepository,
  }) : _photoSearchResultRepository = photoSearchResultRepository;

  List<Photo> get photos => _photos;

  get isLoading => _isLoading;

  void _changeLoadingStatus(bool status) => _isLoading = status;

  void getPhotoList(String keywords) async {
    _changeLoadingStatus(true);
    Future.delayed(const Duration(seconds: 30));
    _photos = await _photoSearchResultRepository.getPhotos(keywords);
    _changeLoadingStatus(false);
    notifyListeners();
  }

  void resetPhotoList() {
    _photos = [];
    notifyListeners();
  }
}
