import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImagesliderProvider extends ChangeNotifier {
  final CarouselController carouselcontoller = CarouselController();
  int _current = 0;

  int get current => _current;

  void setCurrent(int index) {
    _current = index;
    notifyListeners();
  }

  void next() {
    carouselcontoller.nextPage();
  }

  void previous() {
    carouselcontoller.previousPage();
  }
}
