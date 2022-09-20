part of '../screens.dart';

class SignalScreens extends StatefulWidget {
  const SignalScreens({Key? key}) : super(key: key);

  @override
  _SignalScreensState createState() => _SignalScreensState();
}

class _SignalScreensState extends State<SignalScreens> {
  @override
  void initState() {
    context.read<SignalBloc>().add(FetchSignal());
    // _getSignal();
    
    // Future.delayed(Duration(seconds: 1)).then((value) {
    //   showModalBottomSheet(
    //       // isDismissible: false,
    //       context: context,
    //       builder: (BuildContext context) {
    //         return Container(
    //           padding: EdgeInsets.only(top: 50),
    //           height: 250,
    //           child: Column(children: [
    //               Center(
    //                 child: Text(
    //                   "Do you already have a Maybank Sekuritas \n account?",
    //                   style: blackTextFont.copyWith(fontSize: 16, fontWeight: FontWeight.bold,),
    //                   textAlign: TextAlign.center,
    //                 ),
    //               ),
    //               SizedBox(height: 15),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   ElevatedButton(
    //                     style: ButtonStyle(
    //                       padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30)),
    //                       backgroundColor: MaterialStateProperty.all(Colors.white),
    //                       elevation: MaterialStateProperty.all(0),
    //                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                         RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(18.0),
    //                           side: BorderSide(color: primaryColor, width: 1.5)
    //                         )
    //                       )
    //                     ),
    //                     onPressed: (){
    //                       print("test");
    //                     }, 
    //                     child: Text("Already", style: yellowTextFont.copyWith(fontSize :13, fontWeight: FontWeight.bold))
    //                   ),
    //                   SizedBox(width: 25),
    //                   ElevatedButton(
    //                     style: ButtonStyle(
    //                       padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30)),
    //                       backgroundColor: MaterialStateProperty.all(primaryColor),
    //                       elevation: MaterialStateProperty.all(0),
    //                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                         RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(18.0),
    //                           side: BorderSide(color: primaryColor, width: 1.5)
    //                         )
    //                       )
    //                     ),
    //                     onPressed: (){
    //                       print("test");
    //                     }, 
    //                     child: Text("Not Yet", style: TextStyle(color: Colors.white)),
    //                   )
    //                 ],
    //               )
    //           ]),
    //         );
    //       });
    // });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text("Signal ",
            style: blackTextFont.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(Duration(seconds: 2));
          BlocProvider.of<SignalBloc>(context).add(FetchSignal());
        },
        child: BlocBuilder<SignalBloc, SignalState>(
            builder: (context, state) {
              if(state is SignalLoaded){
                return ListView.builder(
                  padding: EdgeInsets.only(bottom: 80),
                  itemCount: state.signal.length,
                  itemBuilder: (context, index) {
                    return SignalCard(state.signal[index]);
                  }
                );
              }
              else if(state is SignalError) {
                return _errorSignalFetch();
              }
              else if(state is SignalInitial) {
                return Center(child: CircularProgressIndicator(color: primaryColor, strokeWidth: 2,));
              }
              return Center(child: CircularProgressIndicator(color: primaryColor, strokeWidth: 2,));
            },
          ),
      ),
      );
  }

  Widget _errorSignalFetch() => 
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Failed to send data signal !", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.w600)),
          SizedBox(height: 15),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30)),
              backgroundColor: MaterialStateProperty.all(primaryColor),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: primaryColor, width: 1.5)
                )
              )
            ),
            onPressed: (){
              context.read<SignalBloc>().add(FetchSignal());
            }, 
            child: Text("Try Again", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
}
