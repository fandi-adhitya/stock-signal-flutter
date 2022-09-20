part of "../screens.dart";

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
           color: primaryColor,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Center(
                 child:
                     Image.asset("assets/brands/logo_black.png", height: 100),
               ),
               SizedBox(height: 20),
               Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2),
                ),
               ),
             ],
           )
       )
    );
  }
}
