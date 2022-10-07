import 'package:flutter/material.dart';
import 'package:food_introduce/ui/pages/home/home_content.dart';

import 'home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(context,"美食广场"),
      body: const HomeContent(),
      // drawer: HomeDrawer(), //抽屉 移到外层
    );
  }
}
