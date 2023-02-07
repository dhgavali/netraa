import 'package:flutter/material.dart';
import 'package:uidesign/Screens/menu/favorite.dart';
import 'package:uidesign/Screens/homepage.dart';
import 'package:uidesign/Screens/profile/my_profile.dart';
import 'package:uidesign/Screens/order/gen_cart.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current_index = 3;

  final screens = [MyProfile(), GenCartPage(), FavoritePage(), HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: current_index,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(
            () {
              this.current_index = index;
            },
          );
        },
        currentIndex: current_index,
        unselectedItemColor: Color(0xffc4c4c4),
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_mall_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: ''),
        ],
      ),
    );
  }
}
