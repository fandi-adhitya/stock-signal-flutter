part of '../screens.dart';

class UserSecuritasSave extends StatelessWidget {
  const UserSecuritasSave({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
            Navigator.push(context, MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => const MainScreen()
              )
            );
            return Future.value(false);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin : EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/icons/waiting.json', height: 260),
                  SizedBox(height: 12),
                  Text(
                    "User ID Securitas saved successfully, please wait for admin verification or contact the help center",
                    style: blackTextFont.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  TextButton(
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => const MainScreen()
                        )
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: holdColor,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(color: Colors.white)
                      )
                    ), 
                    child: Text("OK", style: whiteTextFont.copyWith(fontWeight: FontWeight.bold))
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}