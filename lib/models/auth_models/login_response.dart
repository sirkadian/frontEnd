class LoginResponse {
  String message;
  int userId;
  String username;
  String email;
  String accessToken;
  String refreshToken;

  LoginResponse(
      {this.message,
      this.userId,
      this.username,
      this.email,
      this.accessToken,
      this.refreshToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
