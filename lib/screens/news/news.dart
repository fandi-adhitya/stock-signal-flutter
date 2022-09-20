part of '../screens.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    context.read<NewsBloc>().add(FetchNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text("News",
            style: blackTextFont.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: RefreshIndicator(
        backgroundColor: cloudColor,
        color: primaryColor,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          BlocProvider.of<NewsBloc>(context).add(FetchNews());
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsFetchSuccess) {
                  List<NewsRepsonse> news = state.news.data;
                  return ListView.builder(
                      // padding: EdgeInsets.only(bottom: 80),
                      shrinkWrap: true,
                      itemCount: state.news.data.length,
                      itemBuilder: (context, index) {
                        return NewsCard(state.news.data[index], onTap: () {
                          Navigator.push(context,
                              AnimatedRoute(NewsDetailScreen(news[index])));
                        });
                      });
                } else if (state is NewsFetchFail) {
                  return Container();
                } else if (state is UauthorizedFromNews) {
                  Navigator.of(context)
                      .pushReplacement(AnimatedRoute(MainScreen()));
                } else if (state is NewsInitial) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: primaryColor,
                    strokeWidth: 2,
                  ));
                }
                return Center(
                    child: CircularProgressIndicator(
                  color: primaryColor,
                  strokeWidth: 2,
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
