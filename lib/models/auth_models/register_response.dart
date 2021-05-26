class RegisterResponse {
  String message;
  int id;

  RegisterResponse({this.message, this.id});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['id'] = this.id;
    return data;
  }
}
