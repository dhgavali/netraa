import 'package:flutter/material.dart';
import 'package:uidesign/Screens/auth/login.dart';
import 'package:uidesign/Screens/menu/address.dart';
import 'package:uidesign/Screens/profile/contact_us.dart';
import 'package:uidesign/Screens/profile/edit_profile.dart';
import 'package:uidesign/Screens/menu/favorite.dart';
import 'package:uidesign/Screens/menu/notification.dart';
import 'package:uidesign/Screens/order/orders_page.dart';
import 'package:uidesign/shared/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 150,
                    child: Image(
                      width: 150,
                      height: 150,
                      image: AssetImage(
                        "assets/images/elp.png",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Constant().txt(
                            "Name Name",
                            fsize: 16,
                            fweight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Constant().txt(
                          "sample@sample.com",
                          fsize: 14,
                          txtColor: Constant.klightGrey,
                        ),
                        Constant().txt(
                          "+91 98756 52150",
                          fsize: 14,
                          txtColor: Constant.klightGrey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Divider(
                  color: Constant.klightGrey,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Constant().txt(
                        "General",
                        fsize: 16,
                        txtColor: Constant.klightGrey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    menuItem("Edit Profile", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()));
                    }),
                    menuItem("Notification", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Notifs()));
                    }),
                    menuItem("Add new Address", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddressPage()));
                    }),
                    menuItem("Favourite", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavoritePage()));
                    }),
                    menuItem("My Orders", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrdersPage()));
                    }),
                    menuItem("Contact Us", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ContactUs()));
                    }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Constant().txt(
                        "Legal",
                        fsize: 16,
                        txtColor: Constant.klightGrey,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    menuItem("Terms of Use", () {}),
                    menuItem("Privacy Policy", () {}),
                    menuItem("Logout", () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false);
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  "App Version 0.1.0.1",
                  style: TextStyle(color: Constant.klightGrey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(String name, Function? onpress()) {
    return GestureDetector(
      onTap: onpress,
      child: Card(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          child: Constant().txt(
            name,
            fsize: 16,
            fweight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
