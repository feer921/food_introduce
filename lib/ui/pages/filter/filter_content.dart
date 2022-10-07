import 'package:flutter/material.dart';
import 'package:food_introduce/ui/shared/screen_infos.dart';
import 'package:provider/provider.dart';

import '../../../core/viewmodel/fileter_viewmodel.dart';

class FilterMealContent extends StatelessWidget {
  const FilterMealContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          buildFilterTitle(context),
          buildChoiceSelect(),
        ],
    );
  }


  Widget buildFilterTitle(BuildContext context){
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text("展示你的选择",style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),),
    );
  }

  Widget buildChoiceSelect(){
    return Expanded(
      child: Consumer<FilterViewModel>(
         builder: (ctx,filterVM,child){
           return ListView(
             children: [
               buildListTile("无谷蛋白", "无谷蛋白",filterVM.isGlutenFree, (value) {
                  filterVM.isGlutenFree = value;
               }),
               buildListTile("不含乳糖", "展示不含乳糖的食物",filterVM.isLactoseFree, (value) {
                 filterVM.isLactoseFree = value;
               }),
               buildListTile("普通素食者", "",filterVM.isVegetarian, (value) {
                 filterVM.isVegetarian = value;
               }),
               buildListTile("严格素食主义", "",filterVM.isVegan, (value) {
                 filterVM.isVegan = value;
               }),
             ],
           );
         },
      ),
    );
  }

  Widget buildListTile(String title,String subTitle,bool isFiltered,ValueChanged<bool> onChange){
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(
        value: isFiltered,
        onChanged: onChange,
      ),
    );
  }
}
