import 'package:flutter/material.dart';
import 'package:food_introduce/core/model/meal_model.dart';
import 'package:food_introduce/core/viewmodel/fileter_viewmodel.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<MealBean> _meals = [];

  FilterViewModel? _filterViewModel;

  void update(FilterViewModel filterViewModel){
    _filterViewModel = filterViewModel;
  }


  List<MealBean> get meals {
    return _meals.where((meal){
      if(_filterViewModel != null) {
        /// 如果选择了 无谷蛋白，但当前菜单 非无谷蛋白,则不需要展示
        if(_filterViewModel!.isGlutenFree && !meal.isGlutenFree) return false;
        if(_filterViewModel!.isLactoseFree && !meal.isLactoseFree) return false;
        if(_filterViewModel!.isVegetarian && !meal.isVegetarian) return false;
        if(_filterViewModel!.isVegan && !meal.isVegan) return false;
      }
      return true;
    }).toList();
  }

  List<MealBean> get originMeals => _meals;

  set meals(List<MealBean> value) {
    _meals = value;
    notifyListeners();
  }


}