import 'package:flutter/material.dart';
import 'package:uidesign/Screens/auth/forget_pass.dart';
import 'package:uidesign/shared/constants.dart';
import 'package:uidesign/shared/validators.dart';

class ForgotFirst extends StatefulWidget {
  @override
  State<ForgotFirst> createState() => _ForgotFirstState();
}

class _ForgotFirstState extends State<ForgotFirst> {
  TextEditingController _mobCont = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Constant().txt("Forgot Password",
                        fsize: 25,
                        txtColor: Colors.white,
                        fweight: FontWeight.w700),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Verification code sent to Phone number/ Email.",
                      style: TextStyle(color: Colors.white54),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Constant().cInputField(
                        valids: Validators.novalid,
                        context: context,
                        hint: "Enter Mobile No. / Email ID * ",
                        txController: _mobCont),
                    SizedBox(
                      height: 20,
                    ),
                    Constant().loginBtn(
                        context: context,
                        title: "Continue",
                        onpress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPw()));
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    )
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
