import 'package:flutter/material.dart';
import 'package:uidesign/Screens/home.dart';
import 'package:uidesign/Screens/homepage.dart';
import 'package:uidesign/shared/constants.dart';

import 'package:uidesign/shared/validators.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController _nameCont = new TextEditingController();
  TextEditingController _emailCont = new TextEditingController();
  TextEditingController _phoneCont = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _gender = false;
  bool _gender1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Constant().back_btn_icon(onpress: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }),
        title: Text("My Profile",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    CircleAvatar(
                      maxRadius: 75,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage("assets/icons/profile_one.png"),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 8,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 3.0,
                              color: Color(0xffa1a1a1),
                            ),
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _txInput(
                  lable: "Full Name",
                  txCont: _nameCont,
                  valids: Validators.novalid),
              SizedBox(
                height: 30,
              ),
              _txInput(
                lable: "Email",
                txCont: _emailCont,
                valids: Validators.emailValid,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  validator: Validators.mobValid,
                  controller: _phoneCont,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    label: Text("Phone Number"),
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    prefix: Text(
                      "+91",
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5.0),
                    ),
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.black,
                            value: _gender,
                            onChanged: (value) {
                              this._gender = value!;
                              this._gender1 = false;
                              setState(() {});
                            },
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                              activeColor: Colors.black,
                              value: _gender1,
                              onChanged: (value) {
                                this._gender1 = value!;
                                this._gender = false;
                                setState(() {});
                              }),
                          Text(
                            "Female",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (this._formKey.currentState!.validate()) {
                    print("date validate s");
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.00),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.black,
                  child: Text(
                    "Update Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _txInput(
      {required String lable,
      required TextEditingController txCont,
      required String? valids(String? value)}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: txCont,
        validator: valids,
        decoration: InputDecoration(
          label: Text(lable),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 5.0),
          ),
        ),
        cursorColor: Colors.black,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
