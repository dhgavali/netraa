import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uidesign/shared/constants.dart';

Widget cart_item_details(BuildContext context) {
  String? _value;
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Constant().txt(
            "Indian Kurti",
            fweight: FontWeight.w600,
            fsize: 14,
          ),
        ),
        Flexible(
          child: Constant().txt(
            "A classic t-shirt never goes out of style. This is our most premium collection of shirt.",
            fsize: 12,
            txtColor: Color(0xff555555),
          ),
        ),
        Row(
          children: [
            Text(
              "Rs 999",
              style: TextStyle(
                color: Color(0xff929292),
                fontSize: 16,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Constant().txt(
              "Rs 699",
              fweight: FontWeight.w900,
              fsize: 18,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Constant()
                .txt("Delivery  ", txtColor: Color(0xff929292), fsize: 10),
            Constant().txt(
              "by 28 June 2022 ",
              fsize: 12,
              fweight: FontWeight.bold,
            ),
          ],
        ),
        Row(
          children: [
            // Size dropdown
            Container(
              width: 80,
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Container(
                  child: Text(
                    _value ?? "Size: S",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.end,
                  ),
                ),
                value: _value,
                onChanged: (String? value) {
                  _value = value;
                },
                items: [
                  DropdownMenuItem(
                    child: Text("S"),
                    value: "S",
                  ),
                  DropdownMenuItem(
                    child: Text("M"),
                    value: "M",
                  ),
                  DropdownMenuItem(
                    child: Text("L"),
                    value: "X",
                  ),
                  DropdownMenuItem(
                    child: Text("XL"),
                    value: "XL",
                  ),
                ],
              ),
            ),
            // Qty dropdown
            SizedBox(
              width: 10,
            ),
            Container(
              width: 80,
              child: DropdownButton<String>(
                // dropdownColor: Color(0xffD2D2D2),
                // iconEnabledColor:   Color(0xffD2D2D2),

                isExpanded: true,
                hint: Container(
                  child: Text(
                    _value ?? "Qty: 1",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.end,
                  ),
                ),
                value: _value,
                onChanged: (String? value) {
                  _value = value;
                },
                items: [
                  DropdownMenuItem(
                    child: Text("2  "),
                    value: "2",
                  ),
                  DropdownMenuItem(
                    child: Text("3"),
                    value: "3",
                  ),
                  DropdownMenuItem(
                    child: Text("4"),
                    value: "4",
                  ),
                  DropdownMenuItem(
                    child: Text("5"),
                    value: "5",
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// 1881
//cart item widget
Widget cart_item(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
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
    margin: EdgeInsets.symmetric(
      // horizontal: 10,
      vertical: 10,
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 10,
    ),
    width: MediaQuery.of(context).size.width * 0.8,
    height: MediaQuery.of(context).size.width * 0.4,
    child: Row(
      children: [
        //image
        Container(
          child: Image(
            fit: BoxFit.fitHeight,
            height: MediaQuery.of(context).size.width * 0.32,
            width: MediaQuery.of(context).size.width * 0.2,
            image: AssetImage(
              "assets/images/p2.png",
            ),
          ),
        ),

        SizedBox(
          width: 10,
        ),

        //details column
        cart_item_details(context),
        SizedBox(
          width: 5,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10, right: 10),
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(
            "assets/icons/trash.svg",
            width: 18,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
