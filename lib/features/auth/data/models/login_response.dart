import 'user_model.dart';

class LoginResponse {

  final bool success;
  final String message;
  final UserModel? user;

  LoginResponse({
    required this.success,
    required this.message,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {

    return LoginResponse(
      success: json['success'],
      message: json['message'],
      user: json['data'] != null
          ? UserModel.fromJson(json['data'])
          : null,
    );
  }
}