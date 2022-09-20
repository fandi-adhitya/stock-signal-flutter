part of 'widgets.dart';

class NewsCard extends StatelessWidget {
  final NewsRepsonse news;
  final Function? onTap;
  NewsCard(this.news, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap != null) {
          onTap!();
        }
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(news.publishedAt.toString(), style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.normal)),
            SizedBox(height: 10.0,),
            Text(news.title.toString(), 
              style: blackTextFont.copyWith(fontSize: 16, fontWeight: FontWeight.bold), 
            ),
            SizedBox(height: 10.0,),          
            Divider(color: Colors.black12),
          ],
        ),
      ),
    );
  }
}