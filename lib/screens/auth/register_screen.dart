part of "../screens.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = false;
    _isConfirmPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          shape: AutomaticNotchedShape(RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))),
          color: primaryColor,
          child: Container(
            height: 60,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(color: Colors.white)),
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        textStyle:
                            blackTextFont.copyWith(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Login')),
                ],
              ),
            ),
          ),
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is AuthFailRegister){
              Navigator.pop(context);
              Flushbar(
                  icon: Icon(Icons.cancel, color: Colors.white),
                  flushbarPosition: FlushbarPosition.TOP,
                  title: "Failed to register",
                  backgroundColor: redColor,
                  message: state.message,
                  duration: Duration(seconds: 2),
              )..show(context);
            }
            if(state is AuthSuccessRegister){
              // Navigator.of(context).pop();
              // Navigator.pushNamedAndRemoveUntil(context, "/login", (Route<dynamic> route) => false);
              // WidgetsBinding.instance.addPostFrameCallback((_) {
              //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => YourScreen()));
              // });
            
              showDialog(
                context: context,
                builder: (context) => WillPopScope(
                    onWillPop: () async => false,
                    child: AlertDialog(
                        backgroundColor: Colors.black54,
                        content: Text("Successful registration!", style: yellowTextFont.copyWith(fontWeight: FontWeight.bold)),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pushNamedAndRemoveUntil(context, "/login",  (Route<dynamic> route) => true);
                          }, child: Text("Back to Login", style: yellowTextFont.copyWith(fontWeight: FontWeight.bold)))
                        ],
                      )
                    ),
                );

            }
          },
          child: SingleChildScrollView(
              physics: ScrollPhysics() ,
              child: Padding(
                padding : EdgeInsets.only(bottom : MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  margin: EdgeInsets.only(
                      left: defaultMargin, right: defaultMargin, top: 80),
                  child: Column(
                    children: [
                      Center(
                          child: Image.asset("assets/brands/logo_color.png",
                              height: 100)),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text("Create ",
                              style: blackTextFont.copyWith(
                                  fontSize: 28,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold)),
                          Text("Account",
                              style: blackTextFont.copyWith(fontSize: 28))
                        ],
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.phone,
                        controller: phoneNumberController,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2.5)),
                        ),
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: firstNameController,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                          hintText: "First Name",
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2.5)),
                        ),
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: lastNameController,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                          hintText: "Last Name",
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2.5)),
                        ),
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2.5)),
                        ),
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      TextField(
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          obscureText: !_isPasswordVisible,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                              hintText: "Password",
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: primaryColor, width: 2.5)),
                              suffixIcon: IconButton(
                                  color: primaryColor,
                                  focusColor: primaryColor,
                                  onPressed: () {
                                    _isPasswordVisible = !_isPasswordVisible;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 25,
                                  ))),
                          style: blackTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(height: 20),
                      TextField(
                          keyboardType: TextInputType.text,
                          controller: confirmPasswordController,
                          obscureText: !_isConfirmPasswordVisible,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                              hintText: "Confirm Password",
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: primaryColor, width: 2.5)),
                              suffixIcon: IconButton(
                                  color: primaryColor,
                                  focusColor: primaryColor,
                                  onPressed: () {
                                    _isConfirmPasswordVisible =
                                        !_isConfirmPasswordVisible;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    _isConfirmPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 25,
                                  ))),
                          style: blackTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(height: 20),
                      TextField(
                          keyboardType: TextInputType.text,
                          controller: referralCodeController,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                              hintText: "Referral Code",
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: primaryColor, width: 2.5))),
                          style: blackTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (phoneNumberController.text.trim() == "" &&
                                  emailController.text.trim() == "" &&
                                  passwordController.text.trim() == "" &&
                                  confirmPasswordController.text.trim() == "") {
                                Flushbar(
                                  icon: Icon(Icons.cancel, color: Colors.black),
                                  duration: Duration(seconds: 4),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: primaryColor,
                                  messageColor: Colors.black,
                                  message: "Fill in all the forms below",
                                )..show(context);
                              } else if (passwordController.text !=
                                  confirmPasswordController.text) {
                                Flushbar(
                                  icon: Icon(Icons.cancel, color: Colors.black),
                                  duration: Duration(seconds: 4),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: primaryColor,
                                  messageColor: Colors.black,
                                  message:
                                      "Password and confirm password are not the same",
                                )..show(context);
                              } else if (passwordController.text.length < 6) {
                                Flushbar(
                                  icon: Icon(Icons.cancel, color: Colors.black),
                                  duration: Duration(seconds: 4),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: primaryColor,
                                  messageColor: Colors.black,
                                  message:
                                      "Password must be more than or equal to 6",
                                )..show(context);
                              } else if (!EmailValidator.validate(
                                  emailController.text)) {
                                Flushbar(
                                  icon: Icon(Icons.cancel, color: Colors.black),
                                  duration: Duration(seconds: 4),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: primaryColor,
                                  messageColor: Colors.black,
                                  message: "Wrong email format",
                                )..show(context);
                              } else {
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
                                  AuthRegisterM auth = new AuthRegisterM(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    phone: phoneNumberController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    uplineReferral: referralCodeController.text);
                                  context.read<AuthBloc>().add(GoToAuthRegister(auth));
                              }
                            },
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: secondaryColor,
                            ),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(CircleBorder()),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(20)),
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              )),
        ));
  }
}
