import 'package:flutter/material.dart';

/// 过滤相关的  ViewModel
class FilterViewModel extends ChangeNotifier{

  ///无谷蛋白
  bool _isGlutenFree = false;

  /// 有无乳糖
  bool _isLactoseFree = false;

  /// 素食主义
  bool _isVegetarian  = false;

  /// 严格素食主义
  bool _isVegan = false;

  ///是否过滤了：无谷蛋白
  bool get isGlutenFree => _isGlutenFree;

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }

  /// 是否过滤了：不含乳糖
  bool get isLactoseFree => _isLactoseFree;

  set isLactoseFree(bool valuebool) {
    _isLactoseFree = valuebool;
    notifyListeners();
  }
  ///是否选择了：素食主义
  bool get isVegetarian => _isVegetarian;

  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }

  /// 是否 选择了：严格素食主义
  bool get isVegan => _isVegan;

  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }
}