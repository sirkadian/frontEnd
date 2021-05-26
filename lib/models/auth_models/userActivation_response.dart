class ActivationResponse {
  String message;
  int userId;
  String accessToken;
  String refreshToken;

  ActivationResponse(
      {this.message, this.userId, this.accessToken, this.refreshToken});

  ActivationResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['user_id'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
