
import 'package:flutter/material.dart';
import 'package:food_introduce/ui/pages/home/home_drawer.dart';
import 'init_items.dart';

/// APP 主界面
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _curPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      body: IndexedStack(
        index: _curPageIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curPageIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: bottomBarItems,
        onTap: (index){
          setState((){
            _curPageIndex = index;
          });
        },
      ),
    );
  }
}
