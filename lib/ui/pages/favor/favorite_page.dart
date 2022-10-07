
import 'package:flutter/material.dart';

import 'favorite_content.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的收藏"),
      ),
     body: const FavoriteContent(),
    );
  }
}
