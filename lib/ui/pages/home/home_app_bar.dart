import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  // HomeAppBar(BuildContext context, String appBarTitle) : super(
  //         title: Text(appBarTitle),
  //         leading: Builder(builder: (ctx) { // 抽屉 [HomeDrawer] 移至在外层了，这里不需要这种写法了
  //           return IconButton(
  //             icon: const Icon(Icons.build),
  //             onPressed: () {
  //               //Scaffold.of(ctx) 通过这个找到 上面的 Scaffold
  //               Scaffold.of(ctx).openDrawer();
  //             },
  //           );
  //         }),
  //       );

  HomeAppBar(BuildContext context, String appBarTitle) : super(
    title: Text(appBarTitle),
    leading: IconButton(
      icon: const Icon(Icons.build),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    ),
  );
}
