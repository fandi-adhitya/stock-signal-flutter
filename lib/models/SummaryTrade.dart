class SummaryTradeM {
  SummaryTradeM({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final int statusCode;
  late final List<SummaryTradeData> data;
  
  SummaryTradeM.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    statusCode = json['status_code'];
    data = List.from(json['data']).map((e)=>SummaryTradeData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['status_code'] = statusCode;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SummaryTradeData {
  SummaryTradeData({
    required this.id,
    required this.companyCode,
    required this.companyName,
    required this.stock,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.summaryTrade,
  });
  late final String id;
  late final String companyCode;
  late final String companyName;
  late final int stock;
  late final String note;
  late final String createdAt;
  late final String updatedAt;
  late final List<SummaryTradeList> summaryTrade;
  
  SummaryTradeData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    companyCode = json['company_code'];
    companyName = json['company_name'];
    stock = json['stock'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    summaryTrade = List.from(json['summary_trade']).map((e) => SummaryTradeList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_code'] = companyCode;
    _data['company_name'] = companyName;
    _data['stock'] = stock;
    _data['note'] = note;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['summary_trade'] = summaryTrade.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SummaryTradeList {
  SummaryTradeList({
    required this.id,
    required this.companyId,
    required this.entryPrice,
    required this.allocation,
    required this.takeProfit1,
    required this.takeProfit2,
    required this.currentPrice,
    required this.stopLoss,
    required this.riskToReward,
    required this.returning,
    required this.status,
    required this.entryDate,
    required this.exitDate,
    required this.isForceClose,
     this.reasonForceClose,
    required this.createdAt,
    required this.updatedAt,
    required this.duration,
  });
  late final String id;
  late final String companyId;
  late final int entryPrice;
  late final String allocation;
  late final int takeProfit1;
  late final int takeProfit2;
  late final int currentPrice;
  late final int stopLoss;
  late final String riskToReward;
  late final String returning;
  late final String status;
  late final String entryDate;
  late final String exitDate;
  late final String isForceClose;
  late final Null reasonForceClose;
  late final String createdAt;
  late final String updatedAt;
  late final String duration;
  
  SummaryTradeList.fromJson(Map<String, dynamic> json){
    id = json['id'];
    companyId = json['company_id'];
    entryPrice = json['entry_price'];
    allocation = json['allocation'];
    takeProfit1 = json['take_profit1'];
    takeProfit2 = json['take_profit2'];
    currentPrice = json['current_price'];
    stopLoss = json['stop_loss'];
    riskToReward = json['risk_to_reward'];
    returning = json['return'];
    status = json['status'];
    entryDate = json['entryDate'];
    exitDate = json['exitDate'];
    isForceClose = json['is_force_close'];
    reasonForceClose = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['entry_price'] = entryPrice;
    _data['allocation'] = allocation;
    _data['take_profit1'] = takeProfit1;
    _data['take_profit2'] = takeProfit2;
    _data['current_price'] = currentPrice;
    _data['stop_loss'] = stopLoss;
    _data['risk_to_reward'] = riskToReward;
    _data['return'] = returning;
    _data['status'] = status;
    _data['entryDate'] = entryDate;
    _data['exitDate'] = exitDate;
    _data['is_force_close'] = isForceClose;
    _data['reason_force_close'] = reasonForceClose;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['duration'] = duration;
    return _data;
  }
}