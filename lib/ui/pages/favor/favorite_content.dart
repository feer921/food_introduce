import 'package:flutter/material.dart';
import 'package:food_introduce/core/viewmodel/favor_view_model.dart';
import 'package:food_introduce/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

/// 收藏的内容
class FavoriteContent extends StatelessWidget {
  const FavoriteContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(
      builder: (ctx,favoriteVM,child){
        final mealCount = favoriteVM.favoriteMeals.length;
        if(mealCount < 1) {
          return const Center(
            child: Text("未收藏美食"),
          );
        }

        return ListView.builder(
            itemCount: mealCount,
            itemBuilder: (itemContext, index) {
              return MealItemWidget(favoriteVM.favoriteMeals[index]);
        });
      },
    );
  }
}
