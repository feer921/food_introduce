
import 'package:flutter/material.dart';
import 'package:food_introduce/core/model/meal_model.dart';
import 'package:food_introduce/ui/shared/screen_infos.dart';
/// 菜单详情内容
class MealDetailsContent extends StatelessWidget {

   final MealBean _meal;

   MealDetailsContent(this._meal,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildMealImg(),
          buildTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildTitle(context, "制作步骤"),
          buildMakSteps(context),
        ],
      ),
    );
  }

  /// 1. 横幅菜单图片
  Widget buildMealImg(){
    String imgUrl =  _meal.imageUrl;
    print("imgUrl = $imgUrl");
    return Container(
      width: double.infinity,
      child: Image.network(imgUrl),
    );
  }

  /// 2. 制作材料
  Widget buildMakeMaterial(BuildContext context){
    return buildMakeContainer(
      context: context,
      child: ListView.builder( //LiveView 默认会尽可能大的占据父 Widget的高度
          padding: EdgeInsets.zero,//去除 默认的 底部内边距
          shrinkWrap: true, //让父Widget 适应 ListView的内容高
          physics: const NeverScrollableScrollPhysics(),//让 ListView不内部单独滚动
          itemCount: _meal.ingredients.length,
          itemBuilder: (ctx,index){
            return Card(
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: Text(_meal.ingredients[index]),
              ),
            );
          }
      ),
    );
  }

  Widget buildMakSteps(BuildContext context){
    return buildMakeContainer(
      context: context,
      child: ListView.separated(
          itemCount: _meal.steps.length,
          padding: EdgeInsets.zero,//去除 默认的 底部内边距
          shrinkWrap: true, //让父Widget 适应 ListView的内容高
          physics: const NeverScrollableScrollPhysics(),//让 ListView不内部单独滚动
          itemBuilder: (ctx,index){
            return ListTile(
              leading: CircleAvatar(
                child: Text("#$index"),
              ),
              title: Text(_meal.steps[index]),
            );
          },
          separatorBuilder: (ctx,index){
            return const Divider();
          }
      )
    );
  }

  Widget buildTitle(BuildContext context,String title){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Text(title,style: Theme.of(context).textTheme.bodyText2?.copyWith(
      ),),
    );
  }

   Widget buildMakeContainer({BuildContext? context, Widget? child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8.px),
      ),
      width: MediaQuery.of(context!).size.width - 30.px,
      child: child,
    );
  }
}
