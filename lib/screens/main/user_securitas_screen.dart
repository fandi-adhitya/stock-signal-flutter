part of '../screens.dart';

class UserSecuritasScreen extends StatefulWidget {
  const UserSecuritasScreen({ Key? key }) : super(key: key);

  @override
  _UserSecuritasScreenState createState() => _UserSecuritasScreenState();
}

class _UserSecuritasScreenState extends State<UserSecuritasScreen> {
  TextEditingController identityNumber = TextEditingController();
  TextEditingController userIdSekuritas = TextEditingController();
  void showDialogOnSave() {
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
          ),
        );
  }
  
  void showDialogOnSuccess(){
    showDialog(
    context: context,
    builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
            backgroundColor: Colors.black54,
            content: Text("Successful save User ID Securitas!", style: yellowTextFont.copyWith(fontWeight: FontWeight.bold)),
            actions: [
              TextButton(
                onPressed: (){
                Navigator.pop(context, true);
              }, child: Text("Ok", style: yellowTextFont.copyWith(fontWeight: FontWeight.bold)))
            ],
          )
        ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor : Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context, true);
          }, 
          color: Colors.black,
          iconSize: 16,
          icon: Image.asset("assets/icons/ic_cancel.png", width: 18,)
        ),
        title: Text("User ID Sekuritas", style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body : Container(
        padding: EdgeInsets.all(20),
        child : Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children : [
            Column(
              children: [
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  controller: identityNumber,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                      hintText: "Identity Number / NIK",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: primaryColor, width: 2.5))),
                  style: blackTextFont.copyWith(fontSize: 16, fontWeight: FontWeight.w600)
                ),
                SizedBox(height: 12,),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: userIdSekuritas,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                      hintText: "User ID Securitas",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: primaryColor, width: 2.5))),
                  style: blackTextFont.copyWith(fontSize: 16, fontWeight: FontWeight.w600)
                ),
              ],
            ),
            TextButton(
              onPressed: () async {
                if (userIdSekuritas.text.trim() == "" && identityNumber.text.trim() == "") {
                  Flushbar(
                    icon: Icon(Icons.cancel, color: Colors.black),
                    duration: Duration(seconds: 4),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: primaryColor,
                    messageColor: Colors.black,
                    message: "Fill in all the forms below",
                  )..show(context);
                } else {
                  showDialogOnSave();
                  UserIDSecuritas userIdSecuritas = UserIDSecuritas(userIdSecuritas: userIdSekuritas.text, identityNumber: identityNumber.text);
                  UserIdSecuritasResponse? response  = await UserServices().updateUserIdSecuritas(userIdSecuritas);
                  if(response!.success == true) {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => const UserSecuritasSave()
                      )
                    );
                  } else {
                    Navigator.pop(context);
                    Flushbar(
                        icon: Icon(Icons.cancel, color: Colors.white),
                        flushbarPosition: FlushbarPosition.TOP,
                        title: "Failed to save User ID Securitas",
                        backgroundColor: redColor,
                        message: "Please Try Again..",
                        duration: Duration(seconds: 2),
                    )..show(context);
                  }
                }
              },
              style: TextButton.styleFrom(
                elevation: 1,
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                )
              ), 
              child: Container(
                width: double.infinity,
                height: 40,
                child: 
                  Center(child: Text("Save User ID Securitas", style: whiteTextFont.copyWith(fontWeight: FontWeight.bold)))
              )
            )
          ]
        )
      )
    );
  }
}