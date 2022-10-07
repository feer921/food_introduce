import 'package:flutter/material.dart';
import 'package:food_introduce/core/model/meal_model.dart';
import 'package:food_introduce/core/router/router_infos.dart';
import 'package:food_introduce/core/viewmodel/favor_view_model.dart';
import 'package:food_introduce/ui/shared/screen_infos.dart';
import 'package:food_introduce/ui/widgets/opt_menu_item.dart';
import 'package:provider/provider.dart';

/// 菜单 item 视图
class MealItemWidget extends StatelessWidget {
  final MealBean _meal;
  MealItemWidget(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.px)
        ),
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperationInfos()
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(RouterInfos.mealDetailPage,arguments: _meal);
      },
    );
  }
  final imgRadius = 12.px;


  Widget buildBasicInfo(BuildContext context){
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(imgRadius),
              topRight: Radius.circular(imgRadius)
            ),
            child: Image.network(_meal.imageUrl,width: double.infinity,height: 250.px,fit: BoxFit.cover,),
          ),
          Positioned(
            right: 10.px,
            bottom: 10.px,
            child: Container(
              width: 300.px,
              padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 5.px),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(6.px),
              ),
              child: Text(_meal.title,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white
              ),),
            ),
          )
        ],
      );
  }

  Widget buildOperationInfos() {
    return Padding(
      padding: EdgeInsets.all(6.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OptMenuItemWidget(const Icon(Icons.schedule), "${_meal.duration}分钟"),
          OptMenuItemWidget(const Icon(Icons.restaurant), _meal.difficulty),
          buildFavoriteItem(),
        ],
      ),
    );
  }

  Widget buildFavoriteItem(){
    return Consumer<FavorViewModel>(
      builder: (ctx,favoriteVM,child){
        bool isMealFavorited = favoriteVM.isInFavorite(_meal);
        final icon = isMealFavorited ? Icons.favorite : Icons.favorite_border;
        final iconColor = isMealFavorited ? Colors.red : Colors.black;
        final title = isMealFavorited ? "已收藏" :"未收藏";

        return GestureDetector(
            child: OptMenuItemWidget(Icon(icon,color: iconColor,),title,textColor: iconColor,),
          onTap: (){
              favoriteVM.handleFavoriteMealOrNot(_meal);
          },
        );
      },
    );
  }
}
