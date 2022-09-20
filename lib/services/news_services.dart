part of 'services.dart';

class NewsServices extends ServiceClient {
  Future<News> getNews() async {
    var token = await getTokenFromSharedPreferences();
    var finalUri = Uri.https(URL, NEWS);
    
    var response = await http.get(
      finalUri,
       headers: {
        "Content-Type": "application/json",
        "Accept" : "application/json",
        'Authorization': 'Bearer ' + token!,
      },
    );

    final toJson = jsonDecode(response.body);
    return News.fromJson(toJson);
  }

  Future<NewsDetail> getNewsBySlug(NewsRepsonse news) async {
    var token = await getTokenFromSharedPreferences();
    var finalUri = Uri.https(URL, NEWS + "/" +news.slug);
    var response = await http.get(
      finalUri,
       headers: {
        "Content-Type": "application/json",
        "Accept" : "application/json",
        'Authorization': 'Bearer ' + token!,
      },
    );
    final toJson = jsonDecode(response.body);
    var result = (toJson as Map<String, dynamic>)["data"]["content"];
    return NewsDetail(news, data: result);
  }
}