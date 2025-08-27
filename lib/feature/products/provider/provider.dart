import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task/data/models/model.dart';
import 'package:task/data/services/product/service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService service = ProductService();
  List<ProductModel> _productList = [];
  List<ProductModel>  get  productList => _productList; 
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ProductProvider(){
   getProductProvider();
  }

  Future<void> getProductProvider() async {
    _isLoading = true; 
    notifyListeners();
    try {
      _productList = await service.getProductService();
      log('provider added successfully : $_productList');
    } catch (e) {
      throw Exception("Product fetching error : $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
