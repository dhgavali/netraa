import 'package:flutter/material.dart';
import 'package:uidesign/shared/constants.dart';

class FilterPage extends StatefulWidget {
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double _price = 100;
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
        title: Constant().txt(
          "Filter",
          fsize: 20,
          fweight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.topRight,
                child: Constant().txt(
                  "Clear Filters",
                  fsize: 16,
                  txtColor: Color(0xffA1A1A1),
                ),
              ),
              Container(
                child: Constant().txt(
                  "Price Range",
                  fsize: 18,
                  fweight: FontWeight.bold,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    min_price(),
                    Container(
                      child: Theme(
                        data: ThemeData(
                            sliderTheme: SliderThemeData(
                                activeTrackColor: Color(0xff34A853),
                                thumbColor: Colors.white)),
                        child: Slider(
                          min: 100,
                          max: 10000,
                          value: _price,
                          onChanged: (value) {
                            setState(() {
                              this._price = double.parse(
                                value.toStringAsFixed(0),
                              );
                            });
                          },
                        ),
                      ),
                    ),
                    max_price(),
                  ],
                ),
              ),
              Container(
                child: Divider(
                  color: Color(0xff454545),
                ),
              ),
              Card(
                elevation: 2.0,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Constant().txt("Brand",
                              fweight: FontWeight.w700, fsize: 18),
                          Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width * 0.4,
                            color: Colors.white,
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                // fillColor: Constant.kprimary,
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,

                                prefixIcon: Icon(Icons.search),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: (Colors.grey), width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                ),
                                hintText: "Search",

                                labelStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          outline_box("Roadster"),
                          outline_box("Levis")
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [outline_box("Nike"), outline_box("Brand X")],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Constant().txt(
                          "See More",
                          txtColor: Constant.klightGrey,
                          fsize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Constant()
                        .txt("Size", txtColor: Color(0xff828282), fsize: 16),
                    Container(
                      child: Row(
                        children: [
                          sizeBox("S"),
                          sizeBox("M"),
                          sizeBox("L"),
                          sizeBox("X"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Constant()
                        .txt("Colour", txtColor: Color(0xff828282), fsize: 16),
                    Row(
                      children: [
                        ckBox(Color(0xffFF5656)),
                        ckBox(Color(0xff000000)),
                        ckBox(Color(0xff006CFA)),
                        ckBox(Color(0xffB5EEE7)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: newBtn("Cancel", Colors.white, Colors.black)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: newBtn("Apply", Colors.black, Colors.white)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget newBtn(String title, Color color, Color txt) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.37,
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

  Widget ckBox(Color color) {
    return Container(
      width: 50,
      height: 30,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color),
      ),
    );
  }

  Widget sizeBox(String title) {
    return Container(
      width: 50,
      alignment: Alignment.center,
      height: 30,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Text(title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }

  Widget max_price() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xff626262)),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Text(
            "\u{20B9}" + _price.toString().split(".").first,
            style: TextStyle(
              color: Color(0xff828282),
            ),
          ),
        ],
      ),
    );
  }

  Widget outline_box(String title) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.37,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget min_price() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xff626262)),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Text(
            "\u{20B9} 100",
            style: TextStyle(
              color: Color(0xff828282),
            ),
          ),
        ],
      ),
    );
  }
}
