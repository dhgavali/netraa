import 'package:flutter/material.dart';
import 'package:uidesign/Screens/home.dart';
import 'package:uidesign/Screens/homepage.dart';
import 'package:uidesign/shared/constants.dart';

class VerifyAcc extends StatefulWidget {
  @override
  State<VerifyAcc> createState() => _VerifyAccState();
}

class _VerifyAccState extends State<VerifyAcc> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Constant().txt(
                      "Verify your account",
                      txtColor: Colors.white,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Constant().txt(
                        "Enter the verification code sent to phone number",
                        fsize: 14,
                        txtColor: Colors.white54),
                    SizedBox(
                      height: 40,
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
                      height: 40,
                    ),
                    Constant().loginBtn(
                      context: context,
                      title: "Login",
                      onpress: () {
                        setState(() {
                          _otp = _fieldOne.text +
                              _fieldTwo.text +
                              _fieldThree.text +
                              _fieldFour.text;
                        });

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                            (route) => false);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                  ],
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
