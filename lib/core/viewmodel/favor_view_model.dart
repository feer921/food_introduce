import 'package:flutter/material.dart';

import '../model/meal_model.dart';

/// 收藏 业务 ViewModel
class FavorViewModel extends ChangeNotifier {
  final List<MealBean> _favoriteMeal = [];

  List<MealBean> get favoriteMeals {
    return _favoriteMeal;
  }

  /// 添加要收藏的 菜单
  void addFavoriteMeal(MealBean theMeal) {
    _favoriteMeal.add(theMeal);
    notifyListeners();
  }

  void removeMeal(MealBean theMeal) {
    _favoriteMeal.remove(theMeal);
    notifyListeners();
  }

  /// [theMeal] 是否已收藏
  bool isInFavorite(MealBean theMeal){
    return _favoriteMeal.contains(theMeal);
  }

  /// 处理 菜单项：没有收藏，则收藏；已在收藏，则取消收藏
  void handleFavoriteMealOrNot(MealBean theMeal){
     if(isInFavorite(theMeal)){
       removeMeal(theMeal);
     } else {
       addFavoriteMeal(theMeal);
     }
  }
}
