part of "../screens.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  TextStyle textFieldStyle = TextStyle();

  DateTime preBackpress = DateTime.now();

  @override
  void initState(){
    _isPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: AutomaticNotchedShape(RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)))),
        color: primaryColor,
        child: Container(
          height: 60,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account yet?",
                    style: TextStyle(color: Colors.white)),
                TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle:
                          blackTextFont.copyWith(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(AnimatedRoute(RegisterScreen()));
                    },
                    child: Text('Register')),
              ],
            ),
          ),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFail) {
            Navigator.pop(context);
            Flushbar(
                icon: Icon(Icons.cancel, color: Colors.white),
                flushbarPosition: FlushbarPosition.TOP,
                title: state.message,
                backgroundColor: redColor,
                message: "Wrong phone number and password",
                duration: Duration(seconds: 2),
            )..show(context);
            setState(() {});
          }
          
          if(state is AuthSuccess){
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(AnimatedRoute(MainScreen()));
          }
          
          if(state is AuthSuccessRegister) {
            Flushbar(
                icon: Icon(Icons.cancel, color: Colors.white),
                flushbarPosition: FlushbarPosition.TOP,
                title: state.message,
                backgroundColor: primaryColor,
                message: state.message,
                duration: Duration(seconds: 2),
            )..show(context);
          }
        },
        child: WillPopScope(
          onWillPop: () async {
            final timegap = DateTime.now().difference(preBackpress);
            final cantExit = timegap >= Duration(seconds: 2);
            preBackpress = DateTime.now();
            if(cantExit){
              //show snackbar
              final snack = SnackBar(content: Text('Press Back button again to Exit'),duration: Duration(seconds: 2),);
              ScaffoldMessenger.of(context).showSnackBar(snack);
              return false;
            }else{
              return true;
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(
                left: defaultMargin, right: defaultMargin, top: 80),
            child: Column(
              children: [
                Center(
                    child: Image.asset("assets/brands/logo_color.png",
                        height: 100)),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Halo, ",
                            style: blackTextFont.copyWith(
                                fontSize: 28,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold)),
                        Text("Welcome",
                            style: blackTextFont.copyWith(
                                color: Colors.black, fontSize: 28)),
                        SizedBox(height: 30),
                        TextField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                hintText: "Phone Number",
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: primaryColor, width: 2.5))),
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(height: 20),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: passwordController,
                          cursorColor: primaryColor,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: IconButton(
                                  color: primaryColor,
                                  focusColor: primaryColor,
                                  onPressed: () {
                                    _isPasswordVisible=
                                        !_isPasswordVisible;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                  )),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: primaryColor, width: 2.5))),
                          style: blackTextFont.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: primaryColor,
                                textStyle: blackTextFont.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () async {
                                if(kReleaseMode){
                                  await openUrl("https://fawz-staging.bursaku.id/forgot-password");
                                } else {
                                  await openUrl("https://fawz-staging.bursaku.id/forgot-password");
                                }
                              },
                              child: Text('Forgot Password ?'),
                            ),
                            ElevatedButton(
                              child: Icon(Icons.arrow_forward_ios_sharp, color: secondaryColor),
                              onPressed: () {
                                if(phoneController.text.trim() == "" || passwordController.text.trim() == ""){
                                  Flushbar(
                                        icon: Icon(Icons.cancel, color: Colors.black),
                                        duration: Duration(seconds: 4),
                                        flushbarPosition: FlushbarPosition.TOP,
                                        backgroundColor: primaryColor,
                                        messageColor: Colors.black,
                                        message: "Phone number & password are required",
                                      )..show(context);
                                }
                                else {
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
                                      Auth auth = new Auth(phone: phoneController.text,password: passwordController.text);
                                      context.read<AuthBloc>().add(GoToAuthCheck(auth));
                                      setState(() {});
                                }
                              },
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(20)),
                                  backgroundColor: MaterialStateProperty.all(primaryColor)),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


