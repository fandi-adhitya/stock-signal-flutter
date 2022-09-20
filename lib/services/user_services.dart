part of 'services.dart';

class UserServices extends ServiceClient {
  Future<bool> checkAuthentication() async {
    try{
      var token  = await getTokenFromSharedPreferences();
      var finalUri = Uri.https(URL, CHECK_USER);
      var response = await _httpClient.get(
        finalUri,
        headers: {
          "Accept" : "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer ' + token!,
        },
      );

      return true;
    } catch ( e ){
      return false;
    }
  }

  Future<UserIdSecuritasResponse?> updateUserIdSecuritas(UserIDSecuritas userIDSecuritas) async {
    try{
      var token = await getTokenFromSharedPreferences();
      var response = await _httpClient.put(
        Uri.parse(UPDATE_USER_ID_SECURITAS),
        headers: {
          "Content-Type": "application/json",
          "Accept" : "application/json",
          'Authorization': 'Bearer ' + token!,
        },
        body : jsonEncode(userIDSecuritas)
      );
      return UserIdSecuritasResponse.fromJson(jsonDecode(response.body));
    } catch ( e ) {
      print(e);
    }
  }

  Future<User?> userData() async {
    try{
      var token  = await getTokenFromSharedPreferences();
      var finalUri = Uri.https(URL, USER_STATUS);
      var response = await _httpClient.get(
        finalUri,
        headers: {
          "Content-Type": "application/json",
          "Accept" : "application/json",
          'Authorization': 'Bearer ' + token!,
        },
      );
      return User.fromJson(jsonDecode(response.body));
    } catch ( e ){
      print(e);
    }
    // return null;
  }

  Future<Wallet?> getWalletData() async {
    try{
      var token  = await getTokenFromSharedPreferences();
      var finalUri = Uri.https(URL, WALLET);
      var response = await _httpClient.get(
        finalUri,
        headers: {
          "Content-Type": "application/json",
          "Accept" : "application/json",
          'Authorization': 'Bearer ' + token!,
        },
      );
      return Wallet.fromJson(jsonDecode(response.body));
    } catch ( e ){
      print(e);
    }
  }

  Future<WalletHistory?> getWalletHistory() async {
    try{
      var token  = await getTokenFromSharedPreferences();
      var finalUri = Uri.https(URL, WALLET_HISTORY);
      var response = await _httpClient.get(
        finalUri,
        headers: {
          "Content-Type": "application/json",
          "Accept" : "application/json",
          'Authorization': 'Bearer ' + token!,
        },
      );
      return WalletHistory.fromJson(jsonDecode(response.body));
    } catch ( e ){
      print(e);
    }
  }
}