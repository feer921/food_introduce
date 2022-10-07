import 'package:flutter/material.dart';
import 'package:food_introduce/core/model/category_model.dart';
import 'meal_content.dart';

/// 菜单页面
class MealPage extends StatelessWidget {
  const MealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cateGory = ModalRoute.of(context)?.settings.arguments as CateGoryBean;

    return Scaffold(
      appBar: AppBar(
        title: Text(cateGory.title),
      ),

      body: MealContent(),
    );
  }
}