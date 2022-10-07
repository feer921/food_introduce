import 'package:flutter/material.dart';
import 'package:food_introduce/core/router/router_infos.dart';
import 'package:food_introduce/core/viewmodel/favor_view_model.dart';
import 'package:food_introduce/core/viewmodel/meal_viewmodel.dart';
import 'package:food_introduce/ui/shared/app_theme.dart';
import 'package:food_introduce/ui/shared/screen_infos.dart';
import 'package:provider/provider.dart';

import 'core/viewmodel/fileter_viewmodel.dart';

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => FilterViewModel(),//这里会是懒加载
        ),
        ChangeNotifierProvider(
            create: (ctx) => FavorViewModel(),//这里会是懒加载
        ),
        /// 如果一个 ViewModel需要依赖其他的 ViewModel，则需要使用
        ChangeNotifierProxyProvider<FilterViewModel, MealViewModel?>(
        create: (ctx) => MealViewModel(),
        update: (ctx, filterVM, mealVM) {
          mealVM?.update(filterVM);
          return mealVM;
        },
      ),

      ]
    ,
    child: MyApp(),
    )
  );
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// 1、当我们的 StatelessWidget第一次被插入到 Widget树中时(也就是第一次被创建时);
  /// 2、当我们的父 Widget(parent widget) 发生改变时，子 Widget也会被重新构建；
  /// 3、如果我们的 Widget 依赖 InheritedWidget 的一些数据，InheritedWidget数据发生改变时;
  ///
  @override
  Widget build(BuildContext context) {
    ScreenInfos.init();
    return MaterialApp(
      title: "美食广场",
      //使用 Material 风格
      debugShowCheckedModeBanner: false, //去除 debug 标志 icon
      theme: AppTheme.normalTheme,
      darkTheme: AppTheme.darkTheme,
      routes: RouterInfos.routers,
      initialRoute: RouterInfos.initRoutePath,
      onGenerateRoute: RouterInfos.generateRoute,
    );
  }
}



