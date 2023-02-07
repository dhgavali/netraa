import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uidesign/Screens/order/cart.dart';
import 'package:uidesign/Screens/order/cart_address.dart';
import 'package:uidesign/shared/constants.dart';

class GenCartPage extends StatefulWidget {
  @override
  _GenCartPageState createState() => _GenCartPageState();
}

class _GenCartPageState extends State<GenCartPage> {
  final GlobalKey<FormState> _cartFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _addressFormKey = GlobalKey<FormState>();

  double _steps = 15;
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
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        
        centerTitle: true,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: ,
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                bottom: 10,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 60,
                  child: Constant().btnTwo(
                      context: context,
                      title: "Place Order",
                      onpress: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => CartAddress()));
                      }),
                )),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                cart_item(context),
                cart_item(context),
              ],
            ),
            Positioned(
              bottom: 100,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Constant().txt(
                      "Total 2 Items",
                      txtColor: Colors.grey.shade500,
                      fsize: 14,
                      fweight: FontWeight.w700,
                    ),
                    Constant()
                        .txt("Rs. 1398", fweight: FontWeight.w700, fsize: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
