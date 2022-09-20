part of 'services.dart';

class SignalServices extends ServiceClient {

  Future<SignalResponse> getSignal(int page) async {
    var token  = await getTokenFromSharedPreferences();
    
    Map<String, String> queryParams = {
      "page" : '$page'
    };
    
    var finalUri = Uri.https(URL, SIGNAL, queryParams);
    var response = await _httpClient.get(
      finalUri,
      headers: {
        "Accept" : "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer ' + token!,
      },
    );
    final toJson = jsonDecode(response.body);
    return SignalResponse.fromJson(toJson);
  }
}