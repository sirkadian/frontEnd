import 'package:get/get.dart';
import 'package:sirkadian_project/models/food_models/foodRecomendation_model.dart';
import 'package:sirkadian_project/models/food_models/food_model.dart';
import 'package:sirkadian_project/models/food_models/food_necessity.dart';
import 'package:sirkadian_project/repository/food_repository/food_repository.dart';

class FoodsController extends GetxController {
  FoodRepository _foodRepository = FoodRepository();
  List<AllFoodResponse> allFoodsList = [];
  List<FoodRecomModel> foodsLauk = [];
  List<FoodRecomModel> foodsSayur = [];
  var isLoading = false.obs;
  var foodNecessityModel = FoodNecessityModel();

  @override
  void onInit() {
    fetchFoods();
    // fetchAllFoods();
    // fetchFoodsRecom();
    super.onInit();
  }

  void fetchFoods() async {
    try {
      print(isLoading);
      isLoading(true);
      var allFoods = await _foodRepository.getAllFoods();
      var foodsRecomLauk = await _foodRepository.getFoodRecomLauk();
      var foodsRecomSayur = await _foodRepository.getFoodRecomSayur();
      var foodsNecessity = await _foodRepository.getFoodNecessity();

      if (allFoods != null) {
        allFoods.fold((l) => l, (r) => allFoodsList = r);
      }

      if (foodsRecomLauk != null) {
        foodsRecomLauk.fold((l) => l, (r) => foodsLauk = r);
      }
      if (foodsRecomSayur != null) {
        foodsRecomSayur.fold((l) => l, (r) => foodsSayur = r);
      }
      if (foodsNecessity != null) {
        foodsNecessity.fold((l) => l, (r) => foodNecessityModel = r);
      }
    } finally {
      isLoading(false);
      print(isLoading);
    }
  }

  // void fetchAllFoods() async {
  //   try {} finally {}
  // }

  // void fetchFoodsRecom() async {
  //   try {} finally {}
  // }
}
