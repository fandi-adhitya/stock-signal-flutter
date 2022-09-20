import 'dart:async';
import 'dart:convert';

import 'package:fawz_apps/models/SummaryTrade.dart';
import 'package:fawz_apps/models/models.dart';
import 'package:fawz_apps/shared/shared.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl_standalone.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_services.dart';
part 'signal_services.dart';
part 'news_services.dart';
part 'user_services.dart';
part 'summary_trade_services.dart';
class ServiceClient {
  http.Client _httpClient = new http.Client();

  Future<String?> getTokenFromSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    return token;
  }
}