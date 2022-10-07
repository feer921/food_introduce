
import 'package:flutter/material.dart';

import '../favor/favorite_page.dart';
import '../home/home_page.dart';

final List<Widget> pages = [
  HomePage(),
  FavoritePage()
];

final List<BottomNavigationBarItem> bottomBarItems = [
  const BottomNavigationBarItem(
    label: "首页",
    icon: Icon(Icons.home)
  ),
  const BottomNavigationBarItem(
      label: "收藏",
      icon: Icon(Icons.favorite)
  ),
];

