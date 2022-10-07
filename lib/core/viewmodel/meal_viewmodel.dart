import 'package:food_introduce/core/service/json_parser.dart';
import 'package:food_introduce/core/service/meal_request.dart';
import 'package:food_introduce/core/viewmodel/base_meal_viewmodel.dart';


class MealViewModel extends BaseMealViewModel {
  bool isGainFromNetWork = false;
  MealViewModel() {
    if (isGainFromNetWork) {
      MealRequest.getMealData().then((value) {
        meals = value;
        print("value = $value");
      }).onError((error, stackTrace) {
        print("error = $error");
      });
    } else {
      JsonParser.getMealList().then((value) {
        meals = value;
        print("value = $value");
        notifyListeners();
      }).onError((error, stackTrace) {
        print("error = $error");
      });
    }
  }



}
