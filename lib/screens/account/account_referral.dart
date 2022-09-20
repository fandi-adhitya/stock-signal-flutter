part of '../screens.dart';

class AccountReferralScreen extends StatefulWidget {
  const AccountReferralScreen({ Key? key }) : super(key: key);

  @override
  _AccountReferralScreenState createState() => _AccountReferralScreenState();
}

class _AccountReferralScreenState extends State<AccountReferralScreen> {
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
        title: Text("Referral", style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future : UserServices().userData(),
          builder: (_, snapshot){
            if(snapshot.hasError){
              return Center(child: Text('An error occured'));
            } else if(snapshot.hasData) {
              User user = snapshot.data as User;
              return _buildMemberStatus(user);
            } else {
              return Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Center(
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(color: primaryColor, strokeWidth: 2),
                    )
                  ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildMemberStatus( User userData) => 
    Container(
      margin: EdgeInsets.all(10.0),
      child : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children : [
            Text(
              "Invite your friends to join and get the \nbenefits", 
              style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height : 20), 
            Text(
              "Your current level : ", 
              style : blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 16)
            ),
            SizedBox(height : 20), 
            Image.asset(
              (userData.data.level.toLowerCase() == "silver") ?
              "assets/icons/ic_silver.png" : 
              (userData.data.level.toLowerCase() == "gold") ? 
              "assets/icons/ic_gold.png" : 
              (userData.data.level.toLowerCase() == "diamond") ?
              "assets/icons/ic_diamond.png" : "assets/icons/ic_basic.png", 
              height: 150
            ),
            SizedBox(height : 20), 
            Text(userData.data.level, style : blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize : 18)),
            SizedBox(height : 20),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration : BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border(
                  top: BorderSide(width: 1.0, color: cloudColor),
                  left: BorderSide(width: 1.0, color: cloudColor),
                  right: BorderSide(width: 1.0, color: cloudColor),
                  bottom: BorderSide(width: 1.0, color: cloudColor),
                ),
              ),
              child: Center(
                child: Column(
                  children : [
                    Text("My Members", style: blackTextFont.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height : 10),
                    Text(userData.data.downlineCount.toString(), style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(height : 10),
                    Text("Person", style: blackTextFont.copyWith(fontWeight: FontWeight.bold)),
                  ]
                )
              ),
              
            ),
            SizedBox(height : 20),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration : BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border(
                  top: BorderSide(width: 1.0, color: cloudColor),
                  left: BorderSide(width: 1.0, color: cloudColor),
                  right: BorderSide(width: 1.0, color: cloudColor),
                  bottom: BorderSide(width: 1.0, color: cloudColor),
                ),
              ),
              child: Center(
                child: Column(
                  children : [
                    Text("My Referral Code", style: blackTextFont.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height : 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children : [
                        Text(userData.data.downlineReferral, style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
                        TextButton(onPressed: (){
                            final snackBar = SnackBar(
                              content: Text('Copied to Clipboard', style: yellowTextFont.copyWith(fontWeight: FontWeight.bold),),
                            );
                          Clipboard.setData(ClipboardData(text: userData.data.downlineReferral)).then((value) => ScaffoldMessenger.of(context).showSnackBar(snackBar));
                        }, 
                        child: Text("Copy", style: yellowTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 12),))
                      ]
                    )
                  ]
                )
              ),
            )
          ]
        ),
      )
    );
}