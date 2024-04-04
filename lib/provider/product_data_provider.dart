import 'dart:convert';

import 'package:e_commerce/consts/constants.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDataProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => [..._products];

  int _selectedCategory = categories.length;

  int get getSelectedCategory => _selectedCategory;

  Future<void> setSelectedCategory(int index) async {
    _selectedCategory = index;
    await fetchAndSetProducts();
    notifyListeners();
  }

  Future<void> fetchAndSetProducts() async {
    _products = [];
    print(
        'Selected Category Id: ${categories[_selectedCategory]['categoryId']} \nSelected Category Name: ${categories[_selectedCategory]['categoryName']}');
    String apiUrl =
        'https://api.zariran.com/?category=${categories[_selectedCategory]['categoryId']}';
    Uri url = Uri.parse(apiUrl);
    final response = await http.get(url);
    print('Response: ${response}');
    final extractedData =
        json.decode(response.body)['info'] as Map<String, dynamic>;
    if (extractedData == null) {
      print('Extracted data is null.');
      return;
    }
    print('Extracted data is: ${extractedData.toString()}');
    extractedData.forEach((productId, productData) {
      _products.add(
        Product(
          id: productId,
          title: productData['fa_name'],
          description: productData['fa_name'],
          price: double.parse(productData['price']),
          imageUrl: 'https://zariran.com/images/products/$productId.jpg',
          productCategoryName: productData['dir'],
          brand: productData['dir'],
          quantity: 1,
          isFavorite: true,
          isPopular: true,
        ),
      );
    });
    print('${_products.length} objects added.');
  }
}
