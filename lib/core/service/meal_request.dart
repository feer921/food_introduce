
import 'package:food_introduce/core/model/meal_model.dart';
import 'package:food_introduce/core/service/http_request.dart';

class MealRequest{

  static Future<List<MealBean>> getMealData() async {
    //1. 发送网络请求
    const url = "/meal";

    var result  = await Http.request(url);

    // print("MealRequest: getMealData() result = $result");

    //2. json 转 model
    final mealArray = result["meal"];
    List<MealBean> meals = [];
    for(var json in mealArray){
      meals.add(MealBean.fromJson(json));
    }
    return meals;
  }
}