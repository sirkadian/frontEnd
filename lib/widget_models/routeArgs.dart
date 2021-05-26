import 'package:sirkadian_project/models/food_models/foodRecomendation_model.dart';
import 'package:sirkadian_project/models/food_models/food_model.dart';

class ScreenArguments {
  final List<AllFoodResponse> allFood;
  final List<FoodRecomModel> sayurRecom;
  final List<FoodRecomModel> laukRecom;
  final Function selectedFoodS;
  final Function isSelectedS;
  final Function selectedFoodL;
  final Function isSelectedL;
  final String idSayur;
  final String idLauk;

  ScreenArguments({
    this.allFood,
    this.sayurRecom,
    this.laukRecom,
    this.selectedFoodS,
    this.isSelectedS,
    this.isSelectedL,
    this.selectedFoodL,
    this.idSayur,
    this.idLauk,
  });
}
