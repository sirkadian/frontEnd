class FoodNecessityModel {
  double bmi;
  int calcium;
  double calorie;
  int carbohydrate;
  double copper;
  int fat;
  int fiber;
  int iron;
  int phosphor;
  int potassium;
  int protein;
  int sodium;
  int userAge;
  String userGender;
  int userId;
  int vitA;
  double vitB1;
  double vitB2;
  int vitB3;
  int vitC;
  int zinc;

  FoodNecessityModel(
      {this.bmi,
      this.calcium,
      this.calorie,
      this.carbohydrate,
      this.copper,
      this.fat,
      this.fiber,
      this.iron,
      this.phosphor,
      this.potassium,
      this.protein,
      this.sodium,
      this.userAge,
      this.userGender,
      this.userId,
      this.vitA,
      this.vitB1,
      this.vitB2,
      this.vitB3,
      this.vitC,
      this.zinc});

  factory FoodNecessityModel.fromJson(Map<String, dynamic> json) {
    return FoodNecessityModel(
      bmi: json['bmi'],
      calcium: json['calcium'],
      calorie: json['calorie'],
      carbohydrate: json['carbohydrate'],
      copper: json['copper'],
      fat: json['fat'],
      fiber: json['fiber'],
      iron: json['iron'],
      phosphor: json['phosphor'],
      potassium: json['potassium'],
      protein: json['protein'],
      sodium: json['sodium'],
      userAge: json['user_age'],
      userGender: json['user_gender'],
      userId: json['user_id'],
      vitA: json['vit_a'],
      vitB1: json['vit_b1'],
      vitB2: json['vit_b2'],
      vitB3: json['vit_b3'],
      vitC: json['vit_c'],
      zinc: json['zinc'],
    );
  }
}
