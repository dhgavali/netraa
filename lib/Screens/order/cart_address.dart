import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uidesign/Screens/menu/address.dart';
import 'package:uidesign/Screens/order/cart_payment.dart';
import 'package:uidesign/shared/constants.dart';

class CartAddress extends StatefulWidget {
  @override
  State<CartAddress> createState() => _CartAddressState();
}

class _CartAddressState extends State<CartAddress> {
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
          "Cart Address",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
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
                      Constant()
                          .txt("Cart", txtColor: Color(0xff09873A), fsize: 16),
                      Constant().txt("Address",
                          txtColor: Color(0xff09873A), fsize: 16),
                      Constant().txt("Payment",
                          txtColor: Color(0xffC4C4C4), fsize: 16)
                    ],
                  ),
                ),
                Constant().cSlider(50),
                SizedBox(
                  height: 20,
                ),
                add_box(home),
                add_box(other_box),
              ],
            ),
            Column(
              children: [
                Constant().outline_btn(
                    context: context, title: "Add New Address", onpress: onpr),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 60,
                  child: Constant().btnTwo(
                      context: context,
                      title: "Confirm",
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartPayment()));
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
    );
  }

  void onpr() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddressPage()));
  }

  Widget home() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          color: Color(0xff09873A), borderRadius: BorderRadius.circular(15)),
      child: Text(
        "HOME",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget other_box() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xff09873A)),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        "OTHER",
        style: TextStyle(
          color: Color(0xff09873A),
        ),
      ),
    );
  }

  Widget add_box(Widget opt_widget()) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.4,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Constant().txt(
                        "Name Name",
                        fsize: 18,
                        fweight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Constant().txt("( Default )", fsize: 18),
                    ],
                  ),
                  opt_widget(),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Lora Ipsum Lora Ipsum Lora - 0000001",
                  style: TextStyle(
                    color: Constant.klightGrey,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "City, State",
                  style: TextStyle(
                    color: Constant.klightGrey,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mobile: 9845841254",
                  style: TextStyle(
                    color: Constant.klightGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Constant().outline_btn(
              context: context, title: "Change or Add Address", onpress: onpr)
        ],
      ),
    );
  }
}
