import 'package:e_commerce/consts/constants.dart';
import 'package:flutter/material.dart';

class CategoryDataProvider extends ChangeNotifier {
  int _selectedCategory = categories.length;

  int get getSelectedCategory => _selectedCategory;

  void setSelectedCategory(int index) {
    _selectedCategory = index;
    notifyListeners();
  }
}
