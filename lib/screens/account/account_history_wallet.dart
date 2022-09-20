part of '../screens.dart';

class AccountHistoryScreen extends StatefulWidget {
  const AccountHistoryScreen({ Key? key }) : super(key: key);

  @override
  State<AccountHistoryScreen> createState() => _AccountHistoryScreenState();
}

class _AccountHistoryScreenState extends State<AccountHistoryScreen> {
  NumberFormat format = NumberFormat.decimalPattern('id');

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
        title: Text("History", style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bursakuWallet(),
                  SizedBox(height: 40),
                  Text("History", style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 20),
                  _bursakuWalletHistory()
                ],
              ),
            ),
          )
      ),
    );
  }

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
                                  // showInfoToDownloadBursaku();
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
                padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
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
                              Text("Rp " + format.format(wallet.data!.nominalCash), style: soldText.copyWith(fontWeight: FontWeight.bold))
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

  Widget _bursakuWalletHistory() => FutureBuilder(
    future: UserServices().getWalletHistory(),
    builder: (ctx, snapshot) {
      if(snapshot.hasData){
        WalletHistory walletHistory = snapshot.data as WalletHistory;
        return Container(
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: walletHistory.data.map((e) {
              // int idx = walletHistory.data.indexOf(e);
              return _buildListWalletHistory(e);
            }).toList()
          )
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
  );

  Widget _buildListWalletHistory(DataHistory data){
    var date = DateFormat("yyyy-MM-dd hh:mm:ss").format(new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(data.createdAt));
    return Column(
    children: [
      ListTile(
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reward Trading", style: blackTextFont.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(height: 12),
            Text(date),
          ],
        ),
        trailing: Text("Rp " + format.format(data.commission)),
      ),
      Divider(),
      SizedBox(height: 20)
    ],
  );
  }
  
}


 


