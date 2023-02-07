import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Constant {
  // colors
  static const kprimary = Colors.white;
  static const ksecondary = Colors.grey;
  static const kblack = Colors.black;
  static const klightGrey = Color(0xff555555);

  //fontsize

  static const ftitle = 22;

//icons
  Widget back_btn_icon({required Function? onpress()}) {
    return GestureDetector(
        onTap: onpress, child: Icon(Icons.arrow_back_ios_outlined));
  }

  Widget shop_icon() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      // child: Image.asset(
      //   "assets/icon/shopping-cart.png",
      //   color: Colors.black,
      //   width: 18,
      // ),
      child: Icon(Icons.shopping_cart_outlined),
    );
  }

  Widget newBtn(String title, Color color, Color txt) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10),
      width: 100,
      height: 40,
      child: Text(
        title,
        style: TextStyle(
            color: txt,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: color,
      ),
    );
  }

  Widget outline_btn(
      {required BuildContext context,
      required String title,
      required void onpress()}) {
    return Container(
      alignment: Alignment.bottomCenter,
      // decoration: BoxDecoration(
      //   border: OutlinedBorder(side: BorderSide(color: Colors.)),
      // ),
      child: OutlinedButton(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.65,
          child: Text(
            title,
            style: TextStyle(
                color: Constant.klightGrey, fontWeight: FontWeight.w700),
          ),
        ),
        onPressed: onpress,
      ),
    );
  }

  Widget txt(
    String text, {
    double fsize = 25,
    Color txtColor = Colors.black,
    FontWeight fweight = FontWeight.normal,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fsize,
        color: txtColor,
        fontWeight: fweight,
      ),
    );
  }

  Widget txt2(
    String text, {
    double fsize = 25,
    Color txtColor = Colors.black,
    FontWeight fweight = FontWeight.normal,
  }) {
    return Text(
      text,
      // style: TextStyle(
      //   fontSize: fsize,
      //   color: txtColor,
      //   fontWeight: fweight,

      // ),
      style: GoogleFonts.dmSans(
        fontSize: fsize,
        color: txtColor,
        fontWeight: fweight,
      ),
    );
  }

  Widget cInputField({
    required BuildContext context,
    required String hint,
    required TextEditingController txController,
    required String? valids(String? value),
    TextInputType keyboard = TextInputType.name,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: TextFormField(
        validator: valids,
        keyboardType: keyboard,
        controller: txController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),

          // fillColor: Constant.kprimary,
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: (Colors.white), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),

          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget cpassField({
    required BuildContext context,
    required String hint,
    required TextEditingController txController,
    required String? valids(String? value),
    TextInputType keyboard = TextInputType.name,
    required bool obsecure,
    required Function? changeVisibility(),
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: TextFormField(
        obscureText: obsecure,
        validator: valids,
        keyboardType: keyboard,
        controller: txController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          suffixIcon: GestureDetector(
            onTap: changeVisibility,
            child: obsecure
                ? Icon(Icons.visibility, color: Colors.black)
                : Icon(
                    Icons.visibility_off,
                    color: Colors.black,
                  ),
          ),
          // fillColor: Constant.kprimary,
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: (Colors.white), width: 2.0),
          ),

          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget loginBtn({
    required BuildContext context,
    required String title,
    required Function() onpress,
  }) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xfff3dd69),
              Color(0xffF0C16B),
            ],
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget cSlider(double value) {
    return Container(
      child: Theme(
        data: ThemeData(
          sliderTheme: SliderThemeData(
            activeTrackColor: Color(0xff09873A),
            activeTickMarkColor: Color(0xff09873A),
            thumbColor: Color(0xff09873A),
            trackHeight: 1.0,
            minThumbSeparation: 20,
          ),
        ),
        child: Slider(min: 0, max: 100, value: value, onChanged: (value) {}),
      ),
    );
  }

  Widget starText(String title) {
    return RichText(
      text: TextSpan(
        text: title + " ",
        style: TextStyle(color: Color(0xff555555)),
        children: <TextSpan>[
          TextSpan(text: '*', style: TextStyle(color: Color(0xffff0000))),
        ],
      ),
    );
  }

  Widget btnTwo({
    required BuildContext context,
    required String title,
    required Function() onpress,
  }) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(
                3.0,
                6.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(2.0, 4.0),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ), //BoxShadow
          ],
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffF2DB69),
              Color(0xffF0C26B),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget footer() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.copyright,
              color: Colors.white,
              size: 16.0,
            ),
            Constant()
                .txt("2022Netra.shop", txtColor: Colors.white, fsize: 14.0),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          child: Text("Privacy Policy | Terms & Conditions",
              style: TextStyle(color: Colors.grey.shade500, fontSize: 10.0)),
        )
      ],
    );
  }

  Widget accounts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Colors.white,
          ),
          // width: 40,
          child: Image(
            image: AssetImage("assets/icons/google.png"),
            width: 35,
          ),
        ),
        SizedBox(
          width: 25,
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Colors.white,
          ),
          child: Image(
            image: AssetImage("assets/icons/facebook.png"),
            width: 35,
          ),
        )
      ],
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
      child: TextField(
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
