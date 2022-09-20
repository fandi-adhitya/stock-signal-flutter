part of '../screens.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  NumberFormat format = NumberFormat.decimalPattern('id');

  void showInfoToDownloadBursaku(){
    showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          context: context,
          builder: (BuildContext context) {
            return Wrap(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Please create your PIN first before using BurSAKU", 
                        style: blackTextFont.copyWith(fontWeight:  FontWeight.bold),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 12),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft
                      ),
                      onPressed: () async {
                        await openUrl("https://play.google.com/store/apps/details?id=id.bursaku.mobileapp");
                      }, icon: Icon(Icons.download_rounded, color: primaryColor), label: Text("Tap here", style: yellowTextFont.copyWith(fontWeight: FontWeight.bold),) 
                    ),
                  ]),
                ),
              ],
            );
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        // toolbarHeight: 70,
        centerTitle: true,
        title: Text("Account",
            style: blackTextFont.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthLogout){
            Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                FutureBuilder(
                  future: UserServices().userData(),
                  builder: (ctx, snapshot) {
                    if(snapshot.hasData){
                      User user  = snapshot.data as User;
                      return _account(user);
                    }
                    else {
                      return Center(
                        child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(color: primaryColor, strokeWidth: 2),
                        )
                      );
                    }
                  },
                ),
                SizedBox(height: 10.0),
                Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: _bursakuWallet()
                ),
                // SizedBox(height: 10.0),
                // TextButton.icon(
                //   style: TextButton.styleFrom(
                //     padding: EdgeInsets.zero,
                //     alignment: Alignment.centerLeft
                //   ),
                //   onPressed: () async {
                //     await openUrl("https://play.google.com/store/apps/details?id=id.bursaku.mobileapp");
                //   }, icon: Icon(Icons.info, color: soldColor), label: Text("Untuk menggunakan burSaku, silahkan membuat PIN terlebih dahulu pada aplikasi Bursaku. Tap disini untuk Download Aplikasi", maxLines: 2,) ),
                SizedBox(height: 10.0),
                Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: _other()),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: _logout(),
                ),
                SizedBox(height: 60.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _account(User user) => Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration:
                    BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                child: Center(
                    child: Text(user.data.fullName.substring(0, 2).toLowerCase(),
                        style: whiteTextFont.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 3))),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.data.fullName,
                      style: blackTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5.0),
                  Text(user.data.email),
                ],
              )
            ],
          ),
          // IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.arrow_forward_ios_rounded,
          //       color: greyColor,
          //       size: 20.0,
          //     ))
        ]),
      );
  Widget _bursakuWallet() => FutureBuilder(
    future: UserServices().getWalletData(),
    builder: (ctx, snapshot) {
      if(snapshot.hasData){
        Wallet wallet  = snapshot.data as Wallet;
        if(wallet.data == null){
          return Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            child: Image.asset("assets/icons/ic_bursaku_wallet.png", height: 20.0), 
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("BurSAKU",
                                  style: blackTextFont.copyWith(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              // Text("Rp. 0", style: soldText.copyWith(fontSize: 14, fontWeight: FontWeight.bold),),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.topCenter
                                ),
                                onPressed: (){
                                  showInfoToDownloadBursaku();
                                }, 
                                child: Text("Connect to BurSAKU", style: soldText.copyWith(fontWeight: FontWeight.bold))
                              ),
                              // TextButton.icon(
                              //   style: TextButton.styleFrom(
                              //     padding: EdgeInsets.zero,
                              //     alignment: Alignment.centerLeft
                              //   ),
                              //   onPressed: () async {
                              //     await openUrl("https://play.google.com/store/apps/details?id=id.bursaku.mobileapp");
                              //   }, icon: Icon(Icons.abc, color: soldColor), label: Text("Hubungkan BurSAKU")
                              // ),
                            ],
                          )
                        ],
                      ),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.arrow_forward_ios_rounded,
                  //       color: greyColor,
                  //       size: 20.0,
                  //     ))
                ]),
              );
        } else {
          return Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            child: Image.asset("assets/icons/ic_bursaku_wallet.png", height: 20.0), 
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("BurSAKU",
                                  style: blackTextFont.copyWith(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              // Text("Rp. 0", style: soldText.copyWith(fontSize: 14, fontWeight: FontWeight.bold),),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.centerLeft
                                ),
                                onPressed: (){
                                  // showInfoToDownloadBursaku();
                                  Navigator.of(context).push(AnimatedRoute(AccountHistoryScreen()));

                                }, 
                                child: Text("Rp " + format.format(wallet.data!.nominalCash), style: soldText.copyWith(fontWeight: FontWeight.bold))
                              ),
                              // TextButton.icon(
                              //   style: TextButton.styleFrom(
                              //     padding: EdgeInsets.zero,
                              //     alignment: Alignment.centerLeft
                              //   ),
                              //   onPressed: () async {
                              //     await openUrl("https://play.google.com/store/apps/details?id=id.bursaku.mobileapp");
                              //   }, icon: Icon(Icons.abc, color: soldColor), label: Text("Hubungkan BurSAKU")
                              // ),
                            ],
                          )
                        ],
                      ),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.arrow_forward_ios_rounded,
                  //       color: greyColor,
                  //       size: 20.0,
                  //     ))
                ]),
              );

        }
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
  );

  Widget _other() => Column(
        children: [
          InkWell(
            onTap: () async {
              Navigator.of(context).push(AnimatedRoute(AccountReferralScreen()));
              // await openUrl("https://opening.maybank-ke.co.id/#/register/zuraina/");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_referral.png", height: 20.0),
                    SizedBox(width: 14.0),
                    Text("Referral",
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: greyColor,
                      size: 20.0,
                    ))
              ],
            ),
          ),
          Divider(color: cloudColor),
          InkWell(
            onTap: () async {
              await openUrl("https://opening.maybank-ke.co.id/#/register/zuraina/");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_opening.png", height: 20.0),
                    SizedBox(width: 14.0),
                    Text("Opening an account",
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: greyColor,
                      size: 20.0,
                    ))
              ],
            ),
          ),
          Divider(color: cloudColor),
          InkWell(
            onTap: () async {
              if(Platform.isIOS){
                await openUrl("https://apps.apple.com/id/app/ketrade-pro-id/id640586062");
              }
              if(Platform.isAndroid){
                await openUrl("https://play.google.com/store/apps/details?id=com.onlinetrading.ketrade");
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_tradingplatform.png", height: 20.0),
                    SizedBox(width: 14.0),
                    Text("Trading Platform",
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: greyColor,
                      size: 20.0,
                    ))
              ],
            ),
          ),
          Divider(color: cloudColor),
          InkWell(
            onTap: () {
              Navigator.of(context).push(AnimatedRoute(AccountPrivacyPolicyScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_privacy.png", height: 20.0),
                    SizedBox(width: 14.0),
                    Text("Privacy Policy",
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: greyColor,
                      size: 20.0,
                    ))
              ],
            ),
          ),
          Divider(color: cloudColor),
          InkWell(
            onTap: () {
              Navigator.of(context).push(AnimatedRoute(AccountTermAndConditions()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_opening.png", height: 20.0),
                    SizedBox(width: 14.0),
                    Text("Terms and Conditions",
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: greyColor,
                      size: 20.0,
                    ))
              ],
            ),
          ),
          Divider(color: cloudColor),
          InkWell(
            onTap: () async {
              if (Platform.isIOS) {
                 await openUrl("whatsapp://wa.me/+628116361598");
                } else {
                  await openUrl("whatsapp://send?phone=+628116361598");
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/ic_helpcenter.png", height: 20.0),
                    SizedBox(width: 14.0),
                    Text("Help Center",
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: greyColor,
                      size: 20.0,
                    ))
              ],
            ),
          ),
        ],
      );

  Widget _logout() => InkWell(
        highlightColor: cloudColor,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                    backgroundColor: Colors.black54,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(color: primaryColor, strokeWidth: 2),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Please Wait...", style: yellowTextFont.copyWith(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  )
                )
              );
          context.read<AuthBloc>().add(GoToLogout());
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/ic_power.png", height: 20.0),
                  SizedBox(width: 14.0),
                  Text("Logout",
                      style:
                          blackTextFont.copyWith(fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
        ),
      );
}

Future<void> openUrl(String url, {bool forceWebView = false, bool enableJavaScript = false}) async {
  await launch(url);
}
