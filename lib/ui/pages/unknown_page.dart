
import 'package:flutter/material.dart';
import 'package:food_introduce/ui/shared/app_theme.dart';

class UnKnownPage extends StatelessWidget {
  const UnKnownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("未知页面"),
      ),
      body: const Center(
        child: Text("未知页面",
          style: TextStyle(fontSize: AppTheme.largeFontSize,color: Colors.red),
        ),
      ),
    );
  }
}
