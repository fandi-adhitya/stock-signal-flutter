part of 'models.dart';

class WalletHistory {
  WalletHistory({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  late final String status;
  late final int code;
  late final String message;
  late final List<DataHistory> data;
  
  WalletHistory.fromJson(Map<String, dynamic> json){
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>DataHistory.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class DataHistory {
  DataHistory({
    required this.uid,
    required this.fromMemberId,
    required this.toMemberId,
    required this.percentage,
    required this.commission,
    required this.createdAt,
    required this.updatedAt,
    required this.memberFrom,
    required this.memberTo,
    required this.fromMember,
    required this.toMember,
  });
  late final String uid;
  late final String fromMemberId;
  late final String toMemberId;
  late final String percentage;
  late final int commission;
  late final String createdAt;
  late final String updatedAt;
  late final String memberFrom;
  late final String memberTo;
  late final FromMember fromMember;
  late final ToMember toMember;
  
  DataHistory.fromJson(Map<String, dynamic> json){
    uid = json['uid'];
    fromMemberId = json['from_member_id'];
    toMemberId = json['to_member_id'];
    percentage = json['percentage'];
    commission = json['commission'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    memberFrom = json['member_from'];
    memberTo = json['member_to'];
    fromMember = FromMember.fromJson(json['from_member']);
    toMember = ToMember.fromJson(json['to_member']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uid'] = uid;
    _data['from_member_id'] = fromMemberId;
    _data['to_member_id'] = toMemberId;
    _data['percentage'] = percentage;
    _data['commission'] = commission;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['member_from'] = memberFrom;
    _data['member_to'] = memberTo;
    _data['from_member'] = fromMember.toJson();
    _data['to_member'] = toMember.toJson();
    return _data;
  }
}

class FromMember {
  FromMember({
    required this.id,
    required this.uid,
    required this.identityNumber,
    required this.phone,
    required this.email,
    required this.uplineReferral,
    required this.downlineReferral,
    required this.isTrading,
    required this.status,
    required this.userIdSecuritas,
    required this.level,
    required this.userIdBursaku,
    required this.fullName,
    required this.downlineCount,
  });
  late final int id;
  late final String uid;
  late final String identityNumber;
  late final String phone;
  late final String email;
  late final String uplineReferral;
  late final String downlineReferral;
  late final bool isTrading;
  late final String status;
  late final String userIdSecuritas;
  late final String level;
  late final String userIdBursaku;
  late final String fullName;
  late final int downlineCount;
  
  FromMember.fromJson(Map<String, dynamic> json){
    id = json['id'];
    uid = json['uid'];
    identityNumber = json['identity_number'];
    phone = json['phone'];
    email = json['email'];
    uplineReferral = json['upline_referral'];
    downlineReferral = json['downline_referral'];
    isTrading = json['is_trading'];
    status = json['status'];
    userIdSecuritas = json['user_id_securitas'];
    level = json['level'];
    userIdBursaku = json['user_id_bursaku'];
    fullName = json['full_name'];
    downlineCount = json['downline_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['uid'] = uid;
    _data['identity_number'] = identityNumber;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['upline_referral'] = uplineReferral;
    _data['downline_referral'] = downlineReferral;
    _data['is_trading'] = isTrading;
    _data['status'] = status;
    _data['user_id_securitas'] = userIdSecuritas;
    _data['level'] = level;
    _data['user_id_bursaku'] = userIdBursaku;
    _data['full_name'] = fullName;
    _data['downline_count'] = downlineCount;
    return _data;
  }
}

class ToMember {
  ToMember({
    required this.id,
    required this.uid,
    required this.identityNumber,
    required this.phone,
    required this.email,
     this.uplineReferral,
    required this.downlineReferral,
    required this.isTrading,
    required this.status,
    required this.userIdSecuritas,
    required this.level,
    required this.userIdBursaku,
    required this.fullName,
    required this.downlineCount,
  });
  late final int id;
  late final String uid;
  late final String identityNumber;
  late final String phone;
  late final String email;
  late final Null uplineReferral;
  late final String downlineReferral;
  late final bool isTrading;
  late final String status;
  late final String userIdSecuritas;
  late final String level;
  late final String userIdBursaku;
  late final String fullName;
  late final int downlineCount;
  
  ToMember.fromJson(Map<String, dynamic> json){
    id = json['id'];
    uid = json['uid'];
    identityNumber = json['identity_number'];
    phone = json['phone'];
    email = json['email'];
    uplineReferral = null;
    downlineReferral = json['downline_referral'];
    isTrading = json['is_trading'];
    status = json['status'];
    userIdSecuritas = json['user_id_securitas'];
    level = json['level'];
    userIdBursaku = json['user_id_bursaku'];
    fullName = json['full_name'];
    downlineCount = json['downline_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['uid'] = uid;
    _data['identity_number'] = identityNumber;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['upline_referral'] = uplineReferral;
    _data['downline_referral'] = downlineReferral;
    _data['is_trading'] = isTrading;
    _data['status'] = status;
    _data['user_id_securitas'] = userIdSecuritas;
    _data['level'] = level;
    _data['user_id_bursaku'] = userIdBursaku;
    _data['full_name'] = fullName;
    _data['downline_count'] = downlineCount;
    return _data;
  }
}