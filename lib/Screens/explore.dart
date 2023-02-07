import 'package:flutter/material.dart';
import 'package:uidesign/Screens/filters.dart';
import 'package:uidesign/Screens/order/gen_cart.dart';
import 'package:uidesign/Screens/product/product.dart';
import 'package:uidesign/shared/constants.dart';

import 'dart:math' as math;

class ExplorePage extends StatefulWidget {
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // int _selected = 2;
  // List<BottomNavigationBarItem> _items = [
  //   BottomNavigationBarItem(
  //       icon: Icon(
  //         Icons.account_circle_outlined,
  //       ),
  //       label: ''),
  //   BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
  //   BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), label: ''),
  //   BottomNavigationBarItem(
  //       icon: Icon(
  //         Icons.home_rounded,
  //         color: Colors.black,
  //       ),
  //       label: ''),
  // ];

  // late List<Widget> _pages;
  // late Widget _page1;
  // late Widget _page2;
  // late Widget _page3;
  // late Widget _page4;
  // late int _currentIndex;
  // late Widget _currentPage;

  // void _changeTab(int index) {
  //   if (index != 3) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => _pages[index]));
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _page1 = ProfilePage();
    // _page2 = CartPage();
    // _page3 = FavoritePage();
    // _page4 = HomePage();
    // _pages = [_page1, _page2, _page3, _page4];
    // _currentIndex = 3;
    // _currentPage = _page1;
  }

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
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GenCartPage()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (index) {
      //     _changeTab(index);
      //     setState(
      //       () {
      //         this._selected = index;
      //       },
      //     );
      //   },
      //   currentIndex: _selected,
      //   unselectedItemColor: Color(0xffc4c4c4),
      //   selectedItemColor: Color(0xffc4c4c4),
      //   items: _items,
      // ),
      body: SingleChildScrollView(
        child: Container(
          // alignment: Alignment.center,
          // width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Constant().txt(
                        "Kurtis",
                        fsize: 18,
                      ),
                      Constant().txt(
                        "Libaz Kurti",
                        fsize: 26,
                        fweight: FontWeight.w700,
                      ),
                    ],
                  ),
                  Container(
                    child: OutlinedButton(
                        child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 40,
                          child: Row(
                            children: [
                              Transform.rotate(
                                  angle: 90 * math.pi / 180,
                                  child: Icon(
                                    Icons.tune_outlined,
                                    color: Colors.black,
                                  )),
                              Text(
                                "Filter",
                                style: TextStyle(
                                    color: Constant.klightGrey,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FilterPage()));
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ProductList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pdSquare({required Function? onpress()}) {
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
        width: MediaQuery.of(context).size.width * 0.35,
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
                    child: Icon(
                      Icons.favorite_border,
                    ))
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget ProductList() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.center,
        child: Container(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                pdSquare(onpress: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPg(),
                    ),
                  );
                }),
                pdSquare(onpress: () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                pdSquare(onpress: () {}),
                pdSquare(onpress: () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                pdSquare(onpress: () {}),
                pdSquare(onpress: () {}),
              ],
            ),
            SizedBox(
              height: 25,
            ),
          ]),
        ));
  }
}
