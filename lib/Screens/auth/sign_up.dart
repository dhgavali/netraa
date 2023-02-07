import 'package:flutter/material.dart';
import 'package:uidesign/shared/constants.dart';
import 'package:uidesign/shared/validators.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameCnt = new TextEditingController();
  TextEditingController _emailCnt = new TextEditingController();
  TextEditingController _phoneCnt = new TextEditingController();
  TextEditingController _passCnt = new TextEditingController();
  TextEditingController _cnfpassCnt = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isvisible = true;
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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Constant().txt("Create Account", txtColor: Colors.white),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Constant().cInputField(
                          valids: Validators.novalid,
                          context: context,
                          hint: "Full Name *",
                          txController: _nameCnt),
                      Constant().cInputField(
                          context: context,
                          valids: Validators.emailValid,
                          hint: "Email Id *",
                          keyboard: TextInputType.emailAddress,
                          txController: _emailCnt),
                      Constant().cInputField(
                          context: context,
                          valids: Validators.mobValid,
                          keyboard: TextInputType.phone,
                          hint: "Phone Number *",
                          txController: _phoneCnt),
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
                      Constant().cpassField(
                          obsecure: isvisible,
                          changeVisibility: () {
                            this.isvisible = !this.isvisible;
                            setState(() {});
                          },
                          valids: Validators.passlength,
                          context: context,
                          hint: "Confirm Password *",
                          txController: _cnfpassCnt),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Constant().loginBtn(
                          context: context,
                          title: "Continue",
                          onpress: () {
                            if (this._formKey.currentState!.validate()) {
                              if (_passCnt.text != _cnfpassCnt.text) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Password Not matching"),
                                ));
                              }
                            }
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.16,
                      ),
                      Constant().accounts(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Constant().footer(),
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
