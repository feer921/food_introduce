import 'package:flutter/material.dart';
import 'package:food_introduce/ui/pages/detail/meal_details.dart';
import 'package:food_introduce/ui/pages/main/main_screen.dart';
import 'package:food_introduce/ui/pages/meal/meal_page.dart';
import 'package:food_introduce/ui/pages/unknown_page.dart';

import '../../ui/pages/filter/filter_page.dart';

class RouterInfos{

  static const String initRoutePath = "/";

  static const String mealPage = "/meal_page";
  static const String mealDetailPage = "/meal_detail_page";

  static const String mealFilterPage = "/meal_filter_page";

  static Map<String,WidgetBuilder> routers  = {
    initRoutePath: (ctx) => MainScreen(),
    mealPage: (ctx) => MealPage(),
    mealDetailPage: (ctx) => MealDetailsPage(),
  };


  static RouteFactory? generateRoute = (settings) {
    String? routeName = settings.name;
    switch(routeName){
      case mealFilterPage:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (ctx){
            return FilterMealPage();
          }
        );
    }
    return MaterialPageRoute(builder: (ctx) {
      return const UnKnownPage();
    });
  };
}