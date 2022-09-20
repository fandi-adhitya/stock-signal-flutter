part of 'services.dart';

class AuthServices extends ServiceClient {
   Future<AuthResult?> login(Auth auth) async {
      var response =  await _httpClient.post(
        Uri.parse(LOGIN),
        headers: {
          "Content-Type": "application/json"
        },
        body: jsonEncode(auth),
      );
      return AuthResult.fromJson(jsonDecode(response.body));
  }

  Future<AuthRegisterResponse> register(AuthRegisterM auth) async {
    var response =  await _httpClient.post(
      Uri.parse(REGISTER),
      headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
      },
      body: jsonEncode(auth)
    );

    return AuthRegisterResponse.fromJson(jsonDecode(response.body));
  }

  Future<AuthLogoutM> logout() async {
    var token = await getTokenFromSharedPreferences();
    var response = await _httpClient.post(
      Uri.parse(LOGOUT),
      headers: {
        "Content-Type": "application/json",
        "Accept" : "application/json",
        'Authorization': 'Bearer ' + token!,
      }
    );

    return AuthLogoutM.fromJson(jsonDecode(response.body));
  }

  
}
