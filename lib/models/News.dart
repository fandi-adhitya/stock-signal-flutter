part of 'models.dart';

class News {
  News({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final int statusCode;
  late final List<NewsRepsonse> data;

   @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [
        success,
        message,
        statusCode,
        data
      ];
  
  News.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    statusCode = json['status_code'];
    data = List.from(json['data']).map((e)=> NewsRepsonse.fromJson(e)).toList();
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

class NewsRepsonse {
  NewsRepsonse({
    required this.uid,
    required this.slug,
    required this.title,
    required this.status,
    required this.publishedAt,
    required this.image,
    this.metaInformation,
    required this.createdAt,
    required this.updatedAt,
    required this.tags,
  });
  
  late final String uid;
  late final String slug;
  late final String title;
  late final String status;
  late final String publishedAt;
  late final String image;
  late final Null metaInformation;
  late final String createdAt;
  late final String updatedAt;
  late final List<String> tags;

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [
      uid, slug, title, status, publishedAt, image, createdAt, tags
  ];
  
  NewsRepsonse.fromJson(Map<String, dynamic> json){
    uid = json['uid'];
    slug = json['slug'];
    title = json['title'];
    status = json['status'];
    publishedAt = json['published_at'];
    image = json['image'];
    metaInformation = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tags = List.castFrom<dynamic, String>(json['tags']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uid'] = uid;
    _data['slug'] = slug;
    _data['title'] = title;
    _data['status'] = status;
    _data['published_at'] = publishedAt;
    _data['image'] = image;
    _data['meta_information'] = metaInformation;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['tags'] = tags;
    return _data;
  }
}

class NewsDetail extends NewsRepsonse{
  final String? data;

  NewsDetail(NewsRepsonse news, {this.data}) : super(
    title: news.title,
    tags: news.tags,
    createdAt: news.createdAt,
    image: news.image,
    publishedAt: news.publishedAt,
    slug: news.slug,
    status: news.status,
    uid: news.uid,
    updatedAt: news.updatedAt,
  );

   @override
  List<Object> get props => super.props + [data!];
}

class NewsDetailData {
  late final String content;
  NewsDetailData.fromJson(Map<String, dynamic> json){
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content;
    return _data;
  }

}