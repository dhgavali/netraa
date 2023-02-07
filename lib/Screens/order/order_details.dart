import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uidesign/shared/constants.dart';

class OrderDetails extends StatefulWidget {
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
          "Order Details",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Image(
                  image: AssetImage("assets/images/poster.png"),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Order ID - CZ12345678901243",
                  style: TextStyle(color: Color(0xffBEBDBD)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Constant().txt(
                      "Roadster Kurti Set For Woman Green",
                      fweight: FontWeight.w700,
                      fsize: 18,
                    ),
                  ),
                  Container(
                    child: Constant().txt(
                      " Rs. 699",
                      fweight: FontWeight.w700,
                      fsize: 24,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Constant().txt(
                  "M. Green",
                  txtColor: Color(0xffa4a4a4),
                  fsize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Color(
                  0xffDFDFDF,
                ),
                thickness: 1.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Slider(
                      min: 10,
                      activeColor: Colors.green,
                      max: 100,
                      value: 100,
                      inactiveColor: Colors.green,
                      onChanged: (value) {},
                      thumbColor: Colors.green,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Constant().txt("Ordered",
                            fsize: 14, fweight: FontWeight.bold),
                        Constant().txt("Out For Delivery",
                            fsize: 14, fweight: FontWeight.bold),
                        Constant().txt("Delivered",
                            fsize: 14, fweight: FontWeight.bold),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(child: Text("Thu. 20th Jan 2022")),
                          FittedBox(child: Text("Mon, 24th Jan ‘2022")),
                          FittedBox(child: Text("Mon, 24th Jan ‘2022")),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Color(
                        0xffDFDFDF,
                      ),
                      thickness: 1.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 28,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    Divider(
                      color: Color(
                        0xffDFDFDF,
                      ),
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Constant().txt(
                        "Need Help ?",
                        txtColor: Color(0xffC4C4C4),
                        fsize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Color(
                        0xffDFDFDF,
                      ),
                      thickness: 1.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Constant().txt(
                          "Download your Invoice",
                          txtColor: Color(0xff777777),
                          fsize: 14,
                        ),
                        Icon(
                          Icons.insert_drive_file,
                          color: Colors.blue.shade300,
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(
                        0xffDFDFDF,
                      ),
                      thickness: 1.0,
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
}
