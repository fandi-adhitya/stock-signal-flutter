part of '../screens.dart';

class SummaryScreens extends StatefulWidget {
  const SummaryScreens({ Key? key }) : super(key: key);

  @override
  _SummaryScreensState createState() => _SummaryScreensState();
}

class _SummaryScreensState extends State<SummaryScreens> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text("Summary Trades",
            style: blackTextFont.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: RefreshIndicator(
        backgroundColor: cloudColor,
        color: primaryColor,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          BlocProvider.of<SummaryTradeBloc>(context).add(FetchSummaryTrade());
        },
        child: BlocBuilder<SummaryTradeBloc, SummaryTradeState>(
          builder: (context, state) {
            if(state is SummaryTradeLoaded){
              return ListView.builder(
                  padding: EdgeInsets.only(bottom: 80),
                  itemCount: state.summaryTrade.data.length,
                  itemBuilder: (context, index) {
                    return SummaryCard(state.summaryTrade.data[index]);
                  }
                );
            }
            if(state is SummaryTradeInitial){
              return Center(child: CircularProgressIndicator(color: primaryColor, strokeWidth: 2,));
            }
            return Center(child: CircularProgressIndicator(color: primaryColor, strokeWidth: 2,));
          }
        ),
      ),
    );
  }
    
}