import 'package:flutter/material.dart';
import 'package:uidesign/Screens/home.dart';
import 'package:uidesign/Screens/order/cart.dart';
import 'package:uidesign/Screens/order/cart_address.dart';
import 'package:uidesign/shared/constants.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final GlobalKey<FormState> _cartFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _addressFormKey = GlobalKey<FormState>();
  // final GlobalKey<FormState> _paymentFormKey = GlobalKey<FormState>();
  double _steps = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Shopping Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Icon(Icons.favorite_outlined),
          )
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Constant().txt("Cart",
                            txtColor: Color(0xff09873A), fsize: 16),
                        Constant().txt("Address",
                            txtColor: Color(0xffC4C4C4), fsize: 16),
                        Constant().txt("Payment",
                            txtColor: Color(0xffC4C4C4), fsize: 16)
                      ],
                    ),
                  ),
                  Constant().cSlider(20),
                  SizedBox(
                    height: 20,
                  ),
                  cart_item(context),
                  cart_item(context),
                ],
              ),
              Column(
                children: [
                  Container(
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
                        Constant().txt("Rs. 1398",
                            fweight: FontWeight.w700, fsize: 18),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 60,
                    child: Constant().btnTwo(
                        context: context,
                        title: "Place Order",
                        onpress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartAddress()));
                        }),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
