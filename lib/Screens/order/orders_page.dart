import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uidesign/Screens/order/order_details.dart';
import 'package:uidesign/Screens/order/order_filter.dart';
import 'package:uidesign/shared/constants.dart';

class OrdersPage extends StatefulWidget {
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
          "My Orders",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      onChanged: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search your order here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderFilter(),
                        ),
                      );
                    },
                    child: Container(
                      child: Image(
                        image: AssetImage("assets/icons/filter_icon.png"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              _pdOrdered(onpress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderDetails()));
              }),
              _pdOrdered(onpress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderDetails()));
              }),
              _pdOrdered(onpress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderDetails()));
              }),
              _pdOrdered(onpress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderDetails()));
              }),
              _pdOrdered(onpress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderDetails()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pdOrdered({required Function? onpress()}) {
    return GestureDetector(
      onTap: onpress,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  right: 20.0,
                  left: 10,
                  top: 10,
                  bottom: 10,
                ),
                child: Image(
                  image: AssetImage(
                    "assets/images/p2.png",
                  ),
                  width: 75,
                  height: 75,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivered on April 10",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        "Roadster Kurti Set for Women Green",
                        style: TextStyle(
                          color: Color(0xffA1A1A1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: RatingBar.builder(
                        initialRating: 0,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 14.0,
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
                    Text(
                      "Rate this product now",
                      style: TextStyle(
                        color: Color(0xffC4C4C4),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
