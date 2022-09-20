part of 'models.dart';

class Auth {
  String? phone;
  String? password;

  Auth({this.phone, this.password});

  Auth.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}

class AuthResult {
  bool? success;
  TokenResult? data;
  String? message;

  AuthResult({this.success, this.data, this.message});

  AuthResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new TokenResult.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class TokenResult {
  String? token;
  String? name;

  TokenResult({this.token, this.name});

  TokenResult.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    return data;
  }
}

class AuthCheck {

  AuthCheck({
    required this.success,
    required this.message,
    required this.statusCode,
  });

  // AuthCheck(this.message, this.statusCode, {required this.success});
  
  late final bool success;
  late final String message;
  late final int statusCode;
  
  AuthCheck.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['status_code'] = statusCode;
    return _data;
  }
}

class AuthLogoutM {
  AuthLogoutM({
    required this.status,
  });
  late final String status;
  
  
  AuthLogoutM.fromJson(Map<String, dynamic> json){
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    return _data;
  }
}
class AuthRegisterM {
  AuthRegisterM({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.uplineReferral,
  });
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String password;
  late final String phone;
  late final String uplineReferral;
  
  AuthRegisterM.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    uplineReferral = json['upline_referral'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['upline_referral'] = uplineReferral;
    return _data;
  }
}

class AuthRegisterResponse {
  AuthRegisterResponse({
    required this.success,
    required this.statusCode,
    required this.message,
  });
  late final bool success;
  late final int statusCode;
  late final String message;
  
  AuthRegisterResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['status_code'] = statusCode;
    _data['message'] = message;
    return _data;
  }
}