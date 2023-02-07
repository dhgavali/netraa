import 'package:flutter/material.dart';
import 'package:uidesign/Screens/auth/create_pass.dart';
import 'package:uidesign/shared/constants.dart';

class ForgetPw extends StatefulWidget {
  @override
  State<ForgetPw> createState() => _ForgetPwState();
}

class _ForgetPwState extends State<ForgetPw> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _otp;
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
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_1.png"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.15), BlendMode.dstATop),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Constant().txt("Forgot Password",
                          fsize: 25,
                          txtColor: Colors.white,
                          fweight: FontWeight.w700),
                      SizedBox(
                        height: 30,
                      ),
                      Constant().txt(
                        "Enter OTP",
                        fsize: 22,
                        txtColor: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Enter the verification code sent to phone number",
                        style: TextStyle(color: Colors.white54),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OtpInput(_fieldOne, true),
                            OtpInput(_fieldTwo, false),
                            OtpInput(_fieldThree, false),
                            OtpInput(_fieldFour, false)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Constant().loginBtn(
                          context: context,
                          title: "Continue",
                          onpress: () {
                            // if(!)
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              _otp = _fieldOne.text +
                                  _fieldTwo.text +
                                  _fieldThree.text +
                                  _fieldFour.text;
                            });
                            if (_otp!.length < 4) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Please enter valid OTP"),
                                      duration: Duration(seconds: 2)));
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreatePw(),
                                ),
                              );
                            }
                            print(_otp);
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 35),
                  child: Constant().footer(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      color: Colors.white,
      alignment: Alignment.center,
      child: TextFormField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        style: TextStyle(
          color: Colors.grey.shade800,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            counterText: '',
            hintStyle: TextStyle(color: Colors.grey)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
