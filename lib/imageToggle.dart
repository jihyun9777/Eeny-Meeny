import 'dart:io';

import 'package:flutter/material.dart';

class imageToggle {
  late bool _isSelected;
  // late String _imageURL;

  imageToggle() {
    _isSelected = false;
  }

  void setSelected(bool isSelected) {
    _isSelected = isSelected;
  }

  // void setimageURL(String imageURL) {
  //   _imageURL = imageURL;
  // }

  bool getSelected() {
    return _isSelected;
  }

  // String getImageURL() {
  //   return _imageURL;
  // }
}
