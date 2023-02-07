import 'package:flutter/material.dart';
import 'package:uidesign/Screens/auth/login.dart';
import 'package:uidesign/shared/constants.dart';
import 'package:uidesign/shared/validators.dart';

class CreatePw extends StatefulWidget {
  @override
  State<CreatePw> createState() => _CreatePwState();
}

class _CreatePwState extends State<CreatePw> {
  TextEditingController _passCnt = new TextEditingController();
  TextEditingController _cnfPass = new TextEditingController();

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Constant().txt(
                        "Create Password",
                        txtColor: Colors.white,
                        fweight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      // Constant().cInputField(
                      //     valids: Validators.passlength,
                      //     context: context,
                      //     hint: " Password *",
                      //     txController: _passCnt),
                      // Constant().cInputField(
                      //   valids: Validators.passlength,
                      //   context: context,
                      //   hint: "Confirm Password *",
                      //   txController: _cnfPass,
                      // ),
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
                          hint: "Confirm Pass *",
                          txController: _cnfPass),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Constant().loginBtn(
                        context: context,
                        title: "Save",
                        onpress: () {
                          if (this._formKey.currentState!.validate()) {
                            if (_passCnt.text != _cnfPass.text) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Password not matching"),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Password changed successfully"),
                                ),
                              );
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                  (route) => false);
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Constant().accounts(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.2,
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
      ),
    );
  }
}
