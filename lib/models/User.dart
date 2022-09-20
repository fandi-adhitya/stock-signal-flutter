part of 'models.dart';

class User {
  User({
    required this.succeess,
    required this.data,
    required this.statusCode,
    required this.message,
  });
  late final bool succeess;
  late final UserData data;
  late final int statusCode;
  late final String message;
  
  User.fromJson(Map<String, dynamic> json){
    succeess = json['succeess'];
    data = UserData.fromJson(json['data']);
    statusCode = json['status_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['succeess'] = succeess;
    _data['data'] = data.toJson();
    _data['status_code'] = statusCode;
    _data['message'] = message;
    return _data;
  }
}

class UserData {
  UserData({
    required this.fullName,
    required this.email,
    required this.isTrading,
    required this.status,
    required this.level,
    required this.downlineCount,
    required this.downlineReferral,
    required this.userIdSekuritas,
    required this.userIdBursaku
  });

  late final String fullName;
  late final String email;
  late final bool isTrading;
  late final String? status;
  late final String level;
  late final int downlineCount;
  late final String downlineReferral;
  late final String? userIdSekuritas;
  late final String? userIdBursaku;
  
  UserData.fromJson(Map<String, dynamic> json){
    fullName = json['full_name'];
    email = json['email'];
    isTrading = json['is_trading'];
    status = json['status'];
    level = json['level'];
    downlineCount = json['downline_count'];
    downlineReferral = json['downline_referral'];
    userIdSekuritas = json['user_id_securitas'];
    userIdBursaku = json['user_id_bursaku'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['full_name'] = fullName;
    _data['email'] = email;
    _data['is_trading'] = isTrading;
    _data['status'] = status;
    _data['level'] = level;
    _data['downline_count'] = downlineCount;
    _data['downline_referral'] = downlineReferral;
    _data['user_id_securitas'] = userIdSekuritas;
    _data['user_id_bursaku'] = userIdBursaku;
    return _data;
  }
}

class UserIDSecuritas {
  UserIDSecuritas({
    required this.userIdSecuritas,
    required this.identityNumber
  });
  late final String userIdSecuritas;
  late final String identityNumber;
  UserIDSecuritas.fromJson(Map<String, dynamic> json){
    userIdSecuritas = json['user_id_securitas'];
    identityNumber = json['identity_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id_securitas'] = userIdSecuritas;
    _data['identity_number'] = identityNumber;
    return _data;
  }
}

class UserIdSecuritasResponse {
  UserIdSecuritasResponse({
    required this.success,
    required this.statusCode,
    required this.message,
  });
  late final bool success;
  late final int statusCode;
  late final String message;
  
  UserIdSecuritasResponse.fromJson(Map<String, dynamic> json){
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