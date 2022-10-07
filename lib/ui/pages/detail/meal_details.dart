import 'package:flutter/material.dart';
import 'package:food_introduce/core/viewmodel/favor_view_model.dart';
import 'package:food_introduce/ui/pages/detail/detail_content.dart';
import 'package:provider/provider.dart';

import '../../../core/model/meal_model.dart';

/// 餐的详情页面
class MealDetailsPage extends StatelessWidget {
  const MealDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as MealBean;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),

      body: MealDetailsContent(meal),
    floatingActionButton: Consumer<FavorViewModel>(
      builder: (ctx,favorVM,child){
        ///1. 判断是否是收藏状态
        bool isMealFavorited = favorVM.isInFavorite(meal);
        final iconData = isMealFavorited ? Icons.favorite: Icons.favorite_border;
        final iconColor = isMealFavorited ? Colors.red: Colors.black;

        return FloatingActionButton(
            onPressed: (){
              favorVM.handleFavoriteMealOrNot(meal);
            },
          child: Icon(iconData,color: iconColor,),
        );
      },
    ),
    );
  }
}
