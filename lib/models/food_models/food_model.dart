// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:sirkadian_project/models/url_model.dart';
// import 'package:http/http.dart' as http;

// class Post with ChangeNotifier {
//   String id;
//   final String name;
//   final String foodType;
//   final double calorie;
//   final double protein;
//   final double fat;
//   final String images;
//   final String duration;
//   final List<FoodIngridients> foodIngridientInfo;
//   final List<FoodInstructions> foodInstructions;
//   final List<Post> allFoods = [];
//   bool rendered;

//   Post(
//       {@required this.id,
//       @required this.name,
//       @required this.foodType,
//       @required this.calorie,
//       @required this.protein,
//       @required this.fat,
//       @required this.images,
//       @required this.duration,
//       @required this.foodIngridientInfo,
//       @required this.foodInstructions,
//       this.rendered = false});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     var listIngridients = json['food_ingredients_info'] as List;
//     // print(list.runtimeType);
//     //returns List<dynamic>
//     List<FoodIngridients> foodIngridientInfoList =
//         listIngridients.map((idx) => FoodIngridients.fromJson(idx)).toList();

//     var listInstructions = json['food_instructions'] as List;
//     // print(list.runtimeType);
//     //returns List<dynamic>
//     List<FoodInstructions> foodInstructionsList =
//         listInstructions.map((idx) => FoodInstructions.fromJson(idx)).toList();

//     return Post(
//       id: json['id'].toString(),
//       name: json['name'],
//       foodType: json['food_type'],
//       calorie: json['calorie'],
//       protein: json['protein'],
//       fat: json['fat'],
//       images: json['image_filename'],
//       duration: json['duration'].toString(),
//       foodIngridientInfo: foodIngridientInfoList,
//       foodInstructions: foodInstructionsList,
//     );
//   }

// //   static Future<List<Post>> getFoods() async {
// //     String apiURL = 'https://4b07dae6441b.ngrok.io/api/food/get_all_food_api';

// //     var apiResult = await http.get(apiURL);
// //     var jsonObject = json.decode(apiResult.body);
// //     List<dynamic> foodData = (jsonObject as dynamic);

// //     List<Post> foods = [];
// //     for (int i = 0; i < foodData.length; i++)
// //       foods.add(Post.fromJson(foodData[i]));

// //     return foods;
// //   }
// }

// //json food ingridients
// class FoodIngridients {
//   final String id;
//   final String name;

//   FoodIngridients({this.id, this.name});

//   factory FoodIngridients.fromJson(Map<String, dynamic> json) {
//     return FoodIngridients(
//       id: json['id'].toString(),
//       name: json['ingredients_info'],
//     );
//   }
// }

// //json food instructions
// class FoodInstructions {
//   final String id;
//   final String instruction;

//   FoodInstructions({this.id, this.instruction});

//   factory FoodInstructions.fromJson(Map<String, dynamic> json) {
//     return FoodInstructions(
//       id: json['id'].toString(),
//       instruction: json['instructions'],
//     );
//   }
// }

class AllFoodResponse {
  double calcium;
  double calorie;
  double carbohydrate;
  double copper;
  String difficulty;
  int duration;
  double fat;
  double fiber;
  List<FoodIngredients> foodIngredients;
  List<FoodIngredientsInfo> foodIngredientsInfo;
  List<FoodInstructions> foodInstructions;
  String foodType;
  int id;
  String imageFilename;
  double iron;
  String name;
  double nutriPoint;
  double phosphor;
  double potassium;
  double protein;
  int rating;
  int serving;
  double sodium;
  String tags;
  double vitA;
  double vitB1;
  double vitB2;
  double vitB3;
  double vitC;
  double zinc;

  AllFoodResponse(
      {this.calcium,
      this.calorie,
      this.carbohydrate,
      this.copper,
      this.difficulty,
      this.duration,
      this.fat,
      this.fiber,
      this.foodIngredients,
      this.foodIngredientsInfo,
      this.foodInstructions,
      this.foodType,
      this.id,
      this.imageFilename,
      this.iron,
      this.name,
      this.nutriPoint,
      this.phosphor,
      this.potassium,
      this.protein,
      this.rating,
      this.serving,
      this.sodium,
      this.tags,
      this.vitA,
      this.vitB1,
      this.vitB2,
      this.vitB3,
      this.vitC,
      this.zinc});

  AllFoodResponse.fromJson(Map<String, dynamic> json) {
    calcium = json['calcium'];
    calorie = json['calorie'];
    carbohydrate = json['carbohydrate'];
    copper = json['copper'];
    difficulty = json['difficulty'];
    duration = json['duration'];
    fat = json['fat'];
    fiber = json['fiber'];
    if (json['food_ingredients'] != null) {
      foodIngredients = [];
      json['food_ingredients'].forEach((v) {
        foodIngredients.add(new FoodIngredients.fromJson(v));
      });
    }
    if (json['food_ingredients_info'] != null) {
      foodIngredientsInfo = [];
      json['food_ingredients_info'].forEach((v) {
        foodIngredientsInfo.add(new FoodIngredientsInfo.fromJson(v));
      });
    }
    if (json['food_instructions'] != null) {
      foodInstructions = [];
      json['food_instructions'].forEach((v) {
        foodInstructions.add(new FoodInstructions.fromJson(v));
      });
    }
    foodType = json['food_type'];
    id = json['id'];
    imageFilename = json['image_filename'];
    iron = json['iron'];
    name = json['name'];
    nutriPoint = json['nutri_point'];
    phosphor = json['phosphor'];
    potassium = json['potassium'];
    protein = json['protein'];
    rating = json['rating'];
    serving = json['serving'];
    sodium = json['sodium'];
    tags = json['tags'];
    vitA = json['vit_a'];
    vitB1 = json['vit_b1'];
    vitB2 = json['vit_b2'];
    vitB3 = json['vit_b3'];
    vitC = json['vit_c'];
    zinc = json['zinc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calcium'] = this.calcium;
    data['calorie'] = this.calorie;
    data['carbohydrate'] = this.carbohydrate;
    data['copper'] = this.copper;
    data['difficulty'] = this.difficulty;
    data['duration'] = this.duration;
    data['fat'] = this.fat;
    data['fiber'] = this.fiber;
    if (this.foodIngredients != null) {
      data['food_ingredients'] =
          this.foodIngredients.map((v) => v.toJson()).toList();
    }
    if (this.foodIngredientsInfo != null) {
      data['food_ingredients_info'] =
          this.foodIngredientsInfo.map((v) => v.toJson()).toList();
    }
    if (this.foodInstructions != null) {
      data['food_instructions'] =
          this.foodInstructions.map((v) => v.toJson()).toList();
    }
    data['food_type'] = this.foodType;
    data['id'] = this.id;
    data['image_filename'] = this.imageFilename;
    data['iron'] = this.iron;
    data['name'] = this.name;
    data['nutri_point'] = this.nutriPoint;
    data['phosphor'] = this.phosphor;
    data['potassium'] = this.potassium;
    data['protein'] = this.protein;
    data['rating'] = this.rating;
    data['serving'] = this.serving;
    data['sodium'] = this.sodium;
    data['tags'] = this.tags;
    data['vit_a'] = this.vitA;
    data['vit_b1'] = this.vitB1;
    data['vit_b2'] = this.vitB2;
    data['vit_b3'] = this.vitB3;
    data['vit_c'] = this.vitC;
    data['zinc'] = this.zinc;
    return data;
  }
}

class FoodIngredients {
  int id;
  String name;

  FoodIngredients({this.id, this.name});

  FoodIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class FoodIngredientsInfo {
  int id;
  String ingredientsInfo;

  FoodIngredientsInfo({this.id, this.ingredientsInfo});

  FoodIngredientsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ingredientsInfo = json['ingredients_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ingredients_info'] = this.ingredientsInfo;
    return data;
  }
}

class FoodInstructions {
  int id;
  String instructions;

  FoodInstructions({this.id, this.instructions});

  FoodInstructions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instructions = json['instructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instructions'] = this.instructions;
    return data;
  }
}
