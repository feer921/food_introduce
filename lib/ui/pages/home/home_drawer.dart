import 'package:flutter/material.dart';
import 'package:food_introduce/core/router/router_infos.dart';
import 'package:food_introduce/ui/shared/screen_infos.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox( //包裹一层 更改 抽屉的宽
        width: 250.px,
        child: Drawer(
          child: Column(
            children: [
              buildHeaderView(context),
              buildListTile(context, const Icon(Icons.restaurant), "进餐", (){
                Navigator.of(context).pop();
              }),
              buildListTile(context, const Icon(Icons.settings), "过滤", (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RouterInfos.mealFilterPage);
              }),
            ],
          ),
        ),
    );
  }

  Widget buildHeaderView(BuildContext context){
     return Container(
       width: double.infinity,
       height: 120.px,
       color: Colors.orange,
       alignment: const Alignment(0,0.5),
       child: Text("开始动手",),
     );
  }

  Widget buildListTile(BuildContext context,Widget icon,String title,GestureTapCallback callback){
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: callback,
    );
  }
}
