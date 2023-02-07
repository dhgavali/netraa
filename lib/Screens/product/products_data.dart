import 'package:flutter/material.dart';

Widget ProductBox(
    {required Function? onpress(), required BuildContext context}) {
  return GestureDetector(
    onTap: onpress,
    child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width * 0.70,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: 3.0, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(2.0, 8.0),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Best For Your Wedding",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    children: [
                      Text("Shop Now",
                          style: TextStyle(color: Color(0xffEF5DA8)),
                          textAlign: TextAlign.start),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Image(image: AssetImage("assets/images/product.png")),
            ),
          ],
        )),
  );
}

Widget pdSquare({required BuildContext context, required Function? onpress()}) {
  return GestureDetector(
    onTap: onpress,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(
              3.0,
              3.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(2.0, 2.0),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Image(
              image: AssetImage("assets/images/p2.png"),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            // alignment: Alignment.center,

            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              " Indian kurti",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  " Rs. 699",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.favorite_border),
              )
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    ),
  );
}
