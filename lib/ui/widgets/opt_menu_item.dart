import 'package:flutter/material.dart';
import 'package:food_introduce/ui/shared/screen_infos.dart';

class OptMenuItemWidget extends StatelessWidget {
  final Widget _icon;
  final String _title;
  Color textColor;
  OptMenuItemWidget(this._icon, this._title, {this.textColor = Colors.black,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Row(
        children: [
          _icon,
          SizedBox(width: 5.px,),
          Text(_title,style: TextStyle(
            color: textColor
          ),)
        ],
      ),
    );
  }
}
