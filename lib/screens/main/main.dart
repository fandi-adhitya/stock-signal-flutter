part of '../screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? bottomNavBarIndex;
  PageController? pageController;

  checkIsDisclaimerShow() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool("isDisclaimerShow") == null) {
      sharedPreferences.setBool("isDisclaimerShow", false);
    }
  }

  checkUserIsTrading() async {
    User? checkUser = await UserServices().userData();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    if (checkUser!.data.isTrading == false &&
        checkUser.data.userIdSekuritas == null) {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          isDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Container(
                padding: EdgeInsets.only(top: 50),
                height: 250,
                child: Column(children: [
                  Center(
                    child: Text(
                      "Do you already have a Maybank Sekuritas \n account?",
                      style: blackTextFont.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(horizontal: 30)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: primaryColor, width: 1.5)))),
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(
                            //     fullscreenDialog: true,
                            //     builder: (context) => const UserSecuritasScreen()
                            //   )
                            // );
                            // Navigator.push(context, MaterialPageRoute(
                            //   fullscreenDialog: true,
                            //   builder: (context) => UserSecuritasScreen(),
                            // ));
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) =>
                                        UserSecuritasScreen()))
                                .then((value) {
                              Navigator.pop(context);
                              checkUserIsTrading();
                            });
                            // Navigator.push(context, MaterialPageRoute(
                            //   fullscreenDialog: true,
                            //   builder: (context) => UserSecuritasScreen())).then((value) {
                            //   setState(() {});
                            // });
                          },
                          child: Text("Already",
                              style: yellowTextFont.copyWith(
                                  fontSize: 13, fontWeight: FontWeight.bold))),
                      SizedBox(width: 25),
                      ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 30)),
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: primaryColor, width: 1.5)))),
                        onPressed: () async {
                          await openUrl(
                              "https://opening.maybank-ke.co.id/#/register/zuraina/");
                        },
                        child: Text("Not Yet",
                            style: TextStyle(color: Colors.white)),
                      )
                    ],
                  )
                ]),
              ),
            );
          });
    }
    if (checkUser.data.userIdSekuritas != null &&
        checkUser.data.isTrading == false) {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          isDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50, bottom: 50),
                    child: Column(children: [
                      Center(
                        child: Lottie.asset('assets/icons/waiting.json',
                            height: 160),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Waiting for verification",
                        style: blackTextFont.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      TextButton(
                          onPressed: () async {
                            if (Platform.isIOS) {
                              await openUrl("whatsapp://wa.me/+628116361598");
                            } else {
                              await openUrl(
                                  "whatsapp://send?phone=+628116361598");
                            }
                          },
                          style: TextButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide(color: primaryColor))),
                          child: Text("Contact Help Center",
                              style: yellowTextFont.copyWith(
                                  fontWeight: FontWeight.bold))),
                      SizedBox(height: 12),
                      TextButton.icon(
                        label: Text("Check Again",
                            style: whiteTextFont.copyWith(
                                fontWeight: FontWeight.bold)),
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Phoenix.rebirth(context);
                        },
                        style: TextButton.styleFrom(
                            elevation: 0,
                            backgroundColor: holdColor,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(color: holdColor))),
                      )
                    ]),
                  )
                ],
              ),
            );
          });
    } 
    if(checkUser.data.userIdSekuritas != null && checkUser.data.isTrading == true) {
      if (sharedPreferences.getBool("isDisclaimerShow") == false) {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => const DisclaimerScreen()));
      }
    }
  }

  @override
  void initState() {
    checkIsDisclaimerShow();
    checkUserIsTrading();
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomNavBarIndex = index;
            });
          },
          children: [
            SignalScreens(),
            SummaryScreens(),
            NewsScreen(),
            AccountScreen(),
          ],
        ),
        _bottomNavigationbar(),
      ],
    ));
  }

  Widget _bottomNavigationbar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 0, blurRadius: 1),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                currentIndex: bottomNavBarIndex!,
                unselectedLabelStyle: blackTextFont.copyWith(
                    fontSize: 10, fontWeight: FontWeight.bold),
                selectedLabelStyle: yellowTextFont.copyWith(
                    fontSize: 12, fontWeight: FontWeight.bold),
                selectedItemColor: primaryColor,
                onTap: (index) {
                  setState(() {
                    bottomNavBarIndex = index;
                    pageController?.jumpToPage(bottomNavBarIndex!);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: (bottomNavBarIndex == 0
                          ? Image.asset("assets/icons/ic_signal_active.png",
                              height: 16)
                          : Image.asset("assets/icons/ic_signal.png",
                              height: 16)),
                      label: "Signal"),
                  BottomNavigationBarItem(
                      icon: (bottomNavBarIndex == 1
                          ? Image.asset(
                              "assets/icons/ic_summary_trade_active.png",
                              height: 16)
                          : Image.asset("assets/icons/ic_summary_trade.png",
                              height: 16)),
                      label: "Summary"),
                  BottomNavigationBarItem(
                      icon: (bottomNavBarIndex == 2
                          ? Image.asset("assets/icons/ic_news_active.png",
                              height: 16)
                          : Image.asset("assets/icons/ic_news.png",
                              height: 16)),
                      label: "News"),
                  BottomNavigationBarItem(
                      icon: (bottomNavBarIndex == 3
                          ? Image.asset("assets/icons/ic_user_active.png",
                              height: 16)
                          : Image.asset("assets/icons/ic_user.png",
                              height: 16)),
                      label: "Account"),
                ],
              ),
            )),
      );
}
