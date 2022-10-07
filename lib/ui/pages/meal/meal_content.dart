
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_introduce/core/model/meal_model.dart';
import 'package:food_introduce/core/viewmodel/meal_viewmodel.dart';
import 'package:food_introduce/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

import '../../../core/model/category_model.dart';

/// 菜单 内容界面
class MealContent extends StatelessWidget {
  const MealContent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cateGory = ModalRoute.of(context)?.settings.arguments as CateGoryBean;
    return Selector<MealViewModel,List<MealBean>>(
        selector: (ctx,mealVM) { // selector 返回 S 参数类型
          return mealVM.meals.where((meal) => meal.categories.contains(cateGory.id)).toList();
        },
      shouldRebuild: (previouse,next){
          return !listEquals(previouse, next);
      },
      builder: (ctx,meals,child){
          return ListView.builder(
            itemCount: meals.length,
              itemBuilder: (ctx,index){
                return MealItemWidget(meals[index]);
              }
          );
      },
    );
  }
}

/// Consumer方案
// class MealContent extends StatelessWidget {
//   const MealContent({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final cateGory = ModalRoute.of(context)?.settings.arguments as CateGoryBean;
//     return Consumer<MealViewModel>(builder: (ctx, mealViewModel, child) {
//       final meals = mealViewModel.meals
//           .where((meal) => meal.categories.contains(cateGory.id))
//           .toList();
//       print("meals = $meals");
//       return ListView.builder(
//           itemCount: meals.length,
//           itemBuilder: (ctx, index) {
//             return ListTile(
//               title: Text(meals[index].title),
//             );
//           });
//     });
//   }
// }
