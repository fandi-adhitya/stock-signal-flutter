part of 'services.dart';

class SummaryTradeService extends ServiceClient{
  
  Future<SummaryTradeM> getSummaryTrade() async{
    var token  = await getTokenFromSharedPreferences();
    var finalUri = Uri.https(URL, SUMMARY_TRADE);
    var response = await _httpClient.get(
      finalUri,
      headers: {
        "Accept" : "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer ' + token!,
      },
    );
    final toJson = jsonDecode(response.body);
    return SummaryTradeM.fromJson(toJson);
  }
}