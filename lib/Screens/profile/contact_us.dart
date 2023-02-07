import 'package:flutter/material.dart';

import 'package:uidesign/shared/validators.dart';

class ContactUs extends StatefulWidget {
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController _nameCont = TextEditingController();
  TextEditingController _emailCont = TextEditingController();
  TextEditingController _msgCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.maybePop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Contact Us",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              FittedBox(
                child: Text(
                  "We would love to hear from you.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "If you have any query or any type of suggestion, you can contact us here. We would love to hear from you.",
                  style: TextStyle(
                    color: Color(0xff555555),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _txInput(
                lable: "Name",
                txCont: _nameCont,
                valids: Validators.novalid,
              ),
              SizedBox(
                height: 20,
              ),
              _txInput(
                lable: "Email",
                txCont: _emailCont,
                valids: Validators.emailValid,
              ),
              SizedBox(
                height: 20,
              ),
              _txInput(
                lable: "Message",
                txCont: _msgCont,
                valids: Validators.emailValid,
                mxline: 4,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                color: Colors.black,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Text(
                  "SEND MESSAGE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    _btm(
                      title: "Visit Us",
                      l1: "Patna, Bihar-800001, India",
                      l2: "Phone: +91 62870 73888",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _btm(
                      title: "Get In Touch",
                      l1: "You can get in touch with us on this provided email.",
                      l2: "Email: email@email.com",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _btm({
    required String title,
    required String l1,
    required String l2,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "$l1 \n $l2",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff555555),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _txInput({
    required String lable,
    required TextEditingController txCont,
    required String? valids(
      String? value,
    ),
    int mxline = 1,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: txCont,
        validator: valids,
        maxLines: mxline,
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
