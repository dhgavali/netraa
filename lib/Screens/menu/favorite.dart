import 'package:flutter/material.dart';
import 'package:uidesign/Screens/order/cart.dart';
import 'package:uidesign/Screens/order/cart_page.dart';
import 'package:uidesign/shared/constants.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
          "Favorite",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Constant().shop_icon(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              cart_item(context),
              cart_item(context),
              cart_item(context),
            ],
          ),
        ),
      ),
    );
  }
}
