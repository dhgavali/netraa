import 'package:flutter/material.dart';
import 'package:uidesign/Screens/auth/forgot_first.dart';
import 'package:uidesign/Screens/auth/sign_up.dart';
import 'package:uidesign/Screens/auth/verify_ac.dart';
import 'package:uidesign/shared/constants.dart';
import 'package:uidesign/shared/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailCnt = new TextEditingController();
  TextEditingController _passCnt = new TextEditingController();

  bool isvisible = true;
  bool _value = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_1.png"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.15), BlendMode.dstATop),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login to",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Container(
                        width: 125,
                        height: 125,
                        // color: Colors.white,
                        child:
                            Image(image: AssetImage("assets/images/logo.png")),
                      ),
                    ),
                    // Padding(
                    // child: YourWidget(),
                    // padding:);
                    Constant().cInputField(
                        valids: Validators.novalid,
                        context: context,
                        hint: "Email Id / Phone Number *",
                        keyboard: TextInputType.emailAddress,
                        txController: _emailCnt),
                    Constant().cpassField(
                        obsecure: isvisible,
                        changeVisibility: () {
                          this.isvisible = !this.isvisible;
                          setState(() {});
                        },
                        valids: Validators.passlength,
                        context: context,
                        hint: "Password *",
                        txController: _passCnt),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Row(
                            children: [
                              // CheckboxInputElement(),
                              Checkbox(
                                value: this._value,
                                activeColor: Colors.white,
                                checkColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {
                                    this._value = value!;
                                  });
                                },
                                side: BorderSide(color: Colors.grey.shade600),
                              ),
                              Constant().txt(
                                "Remember Me",
                                txtColor: Colors.grey.shade500,
                                fsize: 14,
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotFirst(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Constant().txt(
                              "Forgot Password? ",
                              txtColor: Color(0xffF3DF75),
                              fsize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Constant().loginBtn(
                        context: context,
                        title: "Login",
                        onpress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyAcc(),
                            ),
                          );
                        }),

                    SizedBox(
                      height: 45,
                    ),
                    Constant().accounts(),
                    SizedBox(
                      height: 26,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: RichText(
                          textScaleFactor: 1.2,
                          text: TextSpan(
                            text: "Don't have account?",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '  Register',
                                style: TextStyle(
                                  color: Color(0xffF3DF75),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),

                    Constant().footer()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
