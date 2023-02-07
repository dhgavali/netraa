import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:uidesign/Screens/menu/notification.dart';
import 'package:uidesign/Screens/order/cart_page.dart';
import 'package:uidesign/Screens/explore.dart';
import 'package:uidesign/Screens/menu/favorite.dart';
import 'package:uidesign/Screens/product/product.dart';
import 'package:uidesign/Screens/profile/profile.dart';
import 'package:uidesign/shared/constants.dart';

class MyKeys {
  static final first = GlobalKey(debugLabel: 'page1');
  static final second = GlobalKey(debugLabel: 'page2');
  static final third = GlobalKey(debugLabel: 'page3');

  static List<GlobalKey> getKeys() => [first, second, third];
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Widget> bannerList = [];
  TabController? _controller;
  // late List<Widget> _pages;
  late int _selectedPage;
//TODO: Add navigator acrross all the pages
  int _selected = 2;
  Constant cd = new Constant();
  CarouselController buttonCarouselController = CarouselController();
  // List<BottomNavigationBarItem> _items = [
  //   BottomNavigationBarItem(
  //       icon: Icon(
  //         Icons.account_circle_outlined,
  //       ),
  //       label: ''),
  //   BottomNavigationBarItem(icon: Icon(Icons.local_mall_outlined), label: ''),
  //   BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), label: ''),
  //   BottomNavigationBarItem(
  //       icon: Icon(
  //         Icons.home_rounded,
  //         color: Colors.black,
  //       ),
  //       label: ''),
  // ];

  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;
  late Widget _page4;
  late int _currentIndex;
  late Widget _currentPage;

  // void _changeTab(int index) {
  //   if (index != 3) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => _pages[index]));
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    _controller = new TabController(length: 4, vsync: this);
    super.initState();
    _page1 = ProfilePage();
    _page2 = CartPage();
    _page3 = FavoritePage();
    _page4 = HomePage();
    _pages = [_page1, _page2, _page3, _page4];
    _currentIndex = 3;
    _currentPage = _page1;
    // _selectedPage = 0;
    // _pages = [
    //   HomePage(
    //       // 1,
    //       // "Page 01",
    //       // MyKeys.getKeys().elementAt(0),
    //       ),
    // ];
  }

// TabController tbc = new TabController(initialIndex: 1, length: 3, vsync: true);
  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            insetPadding: EdgeInsets.all(
              10,
            ),
            actionsPadding: EdgeInsets.symmetric(vertical: 10),
            actions: [
              GestureDetector(
                onTap: () async {
                  exit(0);
                },
                child: Constant().newBtn("YES", Colors.black, Colors.white),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.maybeOf(context)!.pop();
                },
                child: Constant().newBtn("No", Colors.white, Colors.black),
              ),
            ],
            title: Text("Do you want to exit the app"),
          ),
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Notifs()));
              },
              child: Padding(
                padding: EdgeInsets.only(right: 24),
                child: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
          title: Container(
            alignment: Alignment.center,
            child: Text("Netraa",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                )),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    alignment: Alignment.centerLeft,
                    child: cd.txt(
                      "Hi, Ajay",
                      fsize: 20,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "What are you looking for today?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.white,
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      // fillColor: Constant.kprimary,
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: (Colors.grey), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      hintText: "Search Kurti",

                      labelStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.width * 0.4,
                  // child: PageView.builder(itemBuilder: (contex)),
                  child: Wrap(
                      runAlignment: WrapAlignment.start,
                      children: <Widget>[
                        CarouselSlider(
                          items: [
                            Image(
                              image: AssetImage(
                                'assets/images/rectangle.png',
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            autoPlayInterval: Duration(seconds: 4),
                            viewportFraction: 0.9,
                            initialPage: 2,
                            height: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ),
                      ]),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BubbleTabIndicator(
                      indicatorHeight: 25.0,
                      indicatorColor: Colors.black,

                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      // Other flags
                      // indicatorRadius: 1,
                      // insets: EdgeInsets.all(1),
                      // padding: EdgeInsets.all(10)
                    ),
                    controller: _controller,
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.white,
                    onTap: (index) {
                      print(index);
                    },
                    tabs: [
                      Tab(
                        child: Text(
                          "Kurti",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Tab(
                          child: Text(
                        "Pants",
                        style: TextStyle(fontSize: 12),
                      )),
                      Tab(
                          child: Text(
                        "Kurti Set",
                        style: TextStyle(fontSize: 12),
                      )),
                      Tab(
                          child: Text(
                        "Salawars",
                        style: TextStyle(fontSize: 12),
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  child: TabBarView(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Container(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                            ProductBox(onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()));
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Featured Products", style: TextStyle(fontSize: 20)),
                      Text("See All",
                          style: TextStyle(
                              fontSize: 18, color: Colors.grey.shade500))
                    ],
                  ),
                ),
                ProductList(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Top Products", style: TextStyle(fontSize: 20)),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      )
                    ],
                  ),
                ),
                ProductList(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffFFF6F6),
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.0,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  child: Image(
                                    image: AssetImage("assets/icons/jeep.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "FREE SHIPPING",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          "Enjoy free shipping on all orders above \$ 100"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  child: Image(
                                    image: AssetImage("assets/icons/wheel.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "SUPPORT 24/7",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Our support team is there to help you for queries",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.0,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  child: Image(
                                    image:
                                        AssetImage("assets/icons/repeat.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "30 DAYS RETURN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          "Simply return it within 30 days for an exchange"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  child: Image(
                                    image: AssetImage("assets/icons/print.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "100% PAYMENT SECURE",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Our payments are secured with 256 bit encryption",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
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
      ),
    );
  }

  // Widget carasol() {
  //   return Container(
  //     child: ListView.builder(
  //         itemCount: 3,
  //         itemBuilder: (context, index) {
  //           return Container(
  //             child: Text("hrslf"),
  //           );
  //         }),
  //   );
  // }

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
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
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

  Widget ProductList() {
    return Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            Row(
              children: [
                pdSquare(onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPg(),
                    ),
                  );
                }),
                pdSquare(onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPg(),
                    ),
                  );
                }),
              ],
            ),
            Row(
              children: [
                pdSquare(onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPg(),
                    ),
                  );
                }),
                pdSquare(onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPg(),
                    ),
                  );
                }),
              ],
            ),
            Row(
              children: [
                pdSquare(onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPg(),
                    ),
                  );
                }),
                pdSquare(onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPg(),
                    ),
                  );
                }),
              ],
            ),
            SizedBox(
              height: 25,
            ),
          ]),
        ));
  }

  Widget ProductBox({required Function? onpress()}) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
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
}

class SampleWidget extends StatelessWidget {
  const SampleWidget({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10))),
      child: Text(
        label,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
