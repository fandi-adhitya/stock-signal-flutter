part of 'models.dart';

class Wallet {
  String? status;
  int? code;
  String? message;
  WalletData? data;

  Wallet({this.status, this.code, this.message, this.data});

  Wallet.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new WalletData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class WalletData {
  String? uid;
  bool? isWithdrawable;
  int? nominalCash;
  String? level;

  WalletData({this.uid, this.isWithdrawable, this.nominalCash, this.level});

  WalletData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    isWithdrawable = json['is_withdrawable'];
    nominalCash = json['nominal_cash'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['is_withdrawable'] = this.isWithdrawable;
    data['nominal_cash'] = this.nominalCash;
    data['level'] = this.level;
    return data;
  }
}