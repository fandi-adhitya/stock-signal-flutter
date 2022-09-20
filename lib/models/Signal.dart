part of 'models.dart';

class SignalResponse {
  late final bool? success;
  late final List<Data>? data;

  SignalResponse({
    this.success,
    this.data
  });

  SignalResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }
}

// class DataResponse {
//   List<Data>? data;

//   DataResponse({
//     this.data
//   });

//   DataResponse.fromJson(Map<String, dynamic> json) {
//     data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
//   }
// }

class Data {
  String? id;
  String ?companyId;
  int? entryPrice;
  String? allocation;
  int? takeProfit1;
  int? takeProfit2;
  int? currentPrice;
  int? stopLoss;
  String? riskToReward;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? companyCode;
  String? companyName;

  Data({
      this.id,
      this.companyId,
      this.entryPrice,
      this.allocation,
      this.takeProfit1,
      this.takeProfit2,
      this.currentPrice,
      this.stopLoss,
      this.riskToReward,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.companyCode,
      this.companyName
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    entryPrice = json['entry_price'];
    allocation = json['allocation'];
    takeProfit1 = json['take_profit1'];
    takeProfit2 = json['take_profit2'];
    currentPrice = json['current_price'];
    stopLoss = json['stop_loss'];
    riskToReward = json['risk_to_reward'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    companyCode = json['company_code'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['entry_price'] = this.entryPrice;
    data['allocation'] = this.allocation;
    data['take_profit1'] = this.takeProfit1;
    data['take_profit2'] = this.takeProfit2;
    data['current_price'] = this.currentPrice;
    data['stop_loss'] = this.stopLoss;
    data['risk_to_reward'] = this.riskToReward;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['company_code'] = this.companyCode;
    data['company_name'] = this.companyName;
    return data;
  }
}