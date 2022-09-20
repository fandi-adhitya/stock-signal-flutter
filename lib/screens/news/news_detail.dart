part of '../screens.dart';

class NewsDetailScreen extends StatefulWidget {
  final NewsRepsonse news;
  NewsDetailScreen(this.news);

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  String content = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor : Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          color: Colors.black,
          iconSize: 16,
          icon: Image.asset("assets/icons/ic_cancel.png", width: 18,)
        ),
        title: Text(widget.news.title, 
          style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                    widget.news.image,
                    width: double.infinity,
                ),
              ),
              SizedBox(height: 12.0),
              Text(widget.news.publishedAt, style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
              SizedBox(height: 12.0),
              Text(widget.news.title, style: blackTextFont.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 12.0),
              FutureBuilder(
                future: NewsServices().getNewsBySlug(widget.news),
                builder: (_, snapshot){
                  if(snapshot.hasError){
                      return Center(
                        child: Text('An error occured'),
                      );
                  } else if(snapshot.hasData) {
                      NewsDetail detail = snapshot.data as NewsDetail;
                      content = detail.data as String;
                      return HtmlWidget(
                        content, 
                        textStyle: blackTextFont.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w500
                        ),
                      );
                  } else {
                    return Center(
                      child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(color: primaryColor, strokeWidth: 2),
                        )
                      );
                  }
                }                
              )
            ],
          ),
        ),
      ),
    );
  }
}