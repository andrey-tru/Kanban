import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({required this.token});

  final String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

LoginErrorModel loginErrorModelFromJson(String str) =>
    LoginErrorModel.fromJson(json.decode(str));

String loginErrorModelToJson(LoginErrorModel data) =>
    json.encode(data.toJson());

class LoginErrorModel {
  LoginErrorModel({required this.errors});

  final List<dynamic> errors;

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) =>
      LoginErrorModel(
        errors: json["non_field_errors"],
      );

  Map<String, dynamic> toJson() => {
        "errors": errors,
      };
}
