import 'package:flutter/material.dart';
import 'package:uidesign/shared/constants.dart';

class OrderFilter extends StatefulWidget {
  @override
  State<OrderFilter> createState() => OrderFilterState();
}

class OrderFilterState extends State<OrderFilter> {
  List<String> productsList = [];
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
        title: Container(
          padding: EdgeInsets.only(right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Constant().txt(
                "Filters",
                fsize: 18,
              ),
              Constant().txt(
                "Clear Filters",
                txtColor: Color(0xffa1a1a1),
                fsize: 16,
              ),
            ],
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Constant().txt(
                "Order Status",
                fsize: 16,
                txtColor: Color(0xffa1a1a1),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  outline_button("On the way + "),
                  outline_button("Delivered + "),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  outline_button("Cancelled+ "),
                  outline_button("Returned + "),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Constant().txt(
                "Ordet Time",
                fsize: 16,
                txtColor: Color(0xffa1a1a1),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  outline_button("Last 30 days + "),
                  outline_button("2021 + "),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  outline_button("2020 + "),
                  outline_button("older + "),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          )),
    );
  }

  Widget newBtn(String title, Color color, Color txt) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.32,
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

  Widget outline_button(String title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.35,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
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
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 14, color: Color(0xff5F5E77)),
        ),
      ),
    );
  }
}
