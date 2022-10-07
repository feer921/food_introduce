import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_introduce/core/model/category_model.dart';
import 'package:food_introduce/core/model/meal_model.dart';

class JsonParser {
  static Future<List<CateGoryBean>> getCategoryDatas() async {
    /// 1. 加载 json 文件
    final jsonString = await rootBundle.loadString("assets/json/categorys.json");

    // print("jsonString = $jsonString");

    /// 2. 将 jsonString 转成 Map/List
    var s = json.decode(jsonString);

    /// 3. 将 Map 中的内容转成 一个个对象
    final cateGoryList = s["category"];

    List<CateGoryBean> categories = [];
    for (var value in cateGoryList) {
      categories.add(CateGoryBean.fromJson(value));
    }
    return categories;
  }

  static Future<List<MealBean>> getMealList() async {
    /// 1. 加载 json 文件
    final jsonString = await rootBundle.loadString("assets/json/meal.json");

    // print("jsonString = $jsonString");

    /// 2. 将 jsonString 转成 Map/List
    var s = json.decode(jsonString);

    /// 3. 将 Map 中的内容转成 一个个对象
    final mealList = s["meal"];

    List<MealBean> meals = [];
    for (var value in mealList) {
      meals.add(MealBean.fromJson(value));
    }
    return meals;
  }
}
