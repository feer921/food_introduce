
import 'package:flutter/material.dart';
import 'package:food_introduce/core/router/router_infos.dart';
import 'package:food_introduce/core/service/json_parser.dart';
import 'package:food_introduce/ui/shared/screen_infos.dart';

import '../../../core/model/category_model.dart';

/// 首页的内容
class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  List<CateGoryBean> _cateGories = [];

  @override
  void initState() {
    super.initState();
    JsonParser.getCategoryDatas().then((value) {
      setState(() {
        _cateGories = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20.px),
      itemCount: _cateGories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.px,
        crossAxisSpacing: 20.px,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (BuildContext context, int index) {
        CateGoryBean bean = _cateGories[index];
        Color bgColor = bean.bgColor ?? Colors.red;

        return GestureDetector(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  bgColor.withOpacity(.5),
                  bgColor
                ]
              )
            ),
            child: Text(_cateGories[index].title),
          ),
          onTap: (){
            Navigator.of(context).pushNamed(RouterInfos.mealPage,arguments: bean);
          },
        );
      },
    );
  }
}
