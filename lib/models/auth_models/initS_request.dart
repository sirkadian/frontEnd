class InitialSetupRequest {
  int id;
  String dob;
  String gender;
  String lang;
  int height;
  int weight;
  String activityLevel;
  String sportDifficulty;
  bool vegan;
  int maintainWeight;
  List<int> allergy;
  List<int> disease;
  List<int> addiction;

  InitialSetupRequest(
      {this.id,
      this.dob,
      this.gender,
      this.lang,
      this.height,
      this.weight,
      this.activityLevel,
      this.sportDifficulty,
      this.vegan,
      this.maintainWeight,
      this.allergy,
      this.disease,
      this.addiction});

  InitialSetupRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dob = json['dob'];
    gender = json['gender'];
    lang = json['lang'];
    height = json['height'];
    weight = json['weight'];
    activityLevel = json['activity_level'];
    sportDifficulty = json['sport_difficulty'];
    vegan = json['vegan'];
    maintainWeight = json['maintain_weight'];
    allergy = json['allergy'].cast<int>();
    disease = json['disease'].cast<int>();
    addiction = json['addiction'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['lang'] = this.lang;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['activity_level'] = this.activityLevel;
    data['sport_difficulty'] = this.sportDifficulty;
    data['vegan'] = this.vegan;
    data['maintain_weight'] = this.maintainWeight;
    data['allergy'] = this.allergy;
    data['disease'] = this.disease;
    data['addiction'] = this.addiction;
    return data;
  }
}
