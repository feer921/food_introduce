import 'package:flutter/material.dart';

class CateGoryBean {
  String id = "";
  String title = "";
  String color = "";

  Color? bgColor;

  CateGoryBean({required this.id, required this.title, required this.color});

  CateGoryBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];
    final colorInt = int.parse(color,radix: 16);
    
    bgColor = Color(colorInt | 0xFF000000);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['color'] = color;
    return data;
  }
}
