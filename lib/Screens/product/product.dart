import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:uidesign/Screens/order/cart.dart';
import 'package:uidesign/Screens/order/cart_page.dart';
import 'package:uidesign/Screens/order/gen_cart.dart';
import 'package:uidesign/Screens/product/products_data.dart';
import 'package:uidesign/shared/constants.dart';
import '../homepage.dart';

class ProductPg extends StatefulWidget {
  @override
  State<ProductPg> createState() => _ProductPgState();
}

class _ProductPgState extends State<ProductPg> with TickerProviderStateMixin {
  String _size = "S";

  TabController? _tbcontroller;
  final overviewKey = new GlobalKey();
  final reviewKey = new GlobalKey();
  final descKey = new GlobalKey();

  final List<String> _sizeList = <String>["S", "M", "L", "XL"];

  String? _selectedSize;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("S"), value: "S"),
      DropdownMenuItem(child: Text("M"), value: "M"),
      DropdownMenuItem(child: Text("L"), value: "L"),
      DropdownMenuItem(child: Text("XL"), value: "XL"),
    ];

    return menuItems;
  }

  bool isLiked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tbcontroller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
            child: Padding(
              padding: EdgeInsets.only(right: 24),
              child: Icon(Icons.shopping_cart_outlined),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Column(
                      children: [
                        CarouselWithIndicatorDemo(),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3.0, color: Color(0xffEAD785)))),

                  // indicator: BubbleTabIndicator(
                  //   indicatorHeight: 25.0,
                  //   indicatorColor: Colors.black,

                  //   tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  //   // Other flags
                  //   // indicatorRadius: 1,
                  //   // insets: EdgeInsets.all(1),
                  //   // padding: EdgeInsets.all(10)
                  // ),
                  controller: _tbcontroller,
                  unselectedLabelColor: Colors.black,

                  onTap: (index) {
                    print(index);
                  },
                  tabs: [
                    Tab(
                      child: Text(
                        "Overview",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Tab(
                        child: Text(
                      "Description",
                      style: TextStyle(fontSize: 14),
                    )),
                    GestureDetector(
                      onTap: () {
                        print("tapped");
                        Scrollable.ensureVisible(
                            reviewKey.currentState!.context);
                      },
                      child: Tab(
                          child: Text(
                        "Review",
                        style: TextStyle(fontSize: 14),
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Constant().txt(
                    "Title for the Product",
                    fweight: FontWeight.bold,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "\u{20B9}  999.00",
                        style: TextStyle(
                            fontSize: 14,
                            color: Constant.klightGrey,
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\u{20B9}  699.00",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "30% OFF",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffF0C86A),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.share),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Inclusive of all taxes",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffF0C86A),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Container(
                        child: Text(
                          "Select Size",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      value: _selectedSize,
                      onChanged: (String? value) {
                        this._selectedSize = value ?? "";
                        setState(() {});
                      },
                      items: dropdownItems,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 16,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      Container(
                        child: Text(" (15)"),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    text: "Category: ",
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Woman, Polo, Casual',
                        style: TextStyle(color: Color(0xff555555)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    text: "Fabric: ",
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Cotton',
                        style: TextStyle(color: Color(0xff555555)),
                      ),
                    ],
                  ),
                ),
              ),

              //DEscription
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  "A classic t-shirt never goes out of style. This is our most premium collection of shirt. This plain white shirt is made up of pure cotton and has a premium finish.",
                  style: TextStyle(
                    color: Color(0xff555555),
                    fontSize: 16,
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),

              Container(
                key: reviewKey,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.topLeft,
                child: Constant().txt2("Review (102)", fsize: 18),
              ),
              _rvBox(),
              _rvBox(),
              _rvBox(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Constant().txt2(
                    "See All Review",
                    fsize: 18,
                    txtColor: Color(0xff7f7f7f),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.topLeft,
                child: Constant().txt2("Another Product", fsize: 18),
              ),
              Row(
                children: [
                  pdSquare(
                      context: context,
                      onpress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPg(),
                          ),
                        );
                      }),
                  pdSquare(
                      context: context,
                      onpress: () {
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
                  pdSquare(
                      context: context,
                      onpress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPg(),
                          ),
                        );
                      }),
                  pdSquare(
                      context: context,
                      onpress: () {
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
                height: 50,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Constant().loginBtn(
          context: context,
          title: "Add to cart",
          onpress: () {
            //TODO: Change this
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => CartPage()));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          }),
    );
  }

  Widget _rvBox() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Image(
                      image: AssetImage("assets/images/elp.png"),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Constant().txt2(
                              "Madelina",
                              fsize: 16,
                            ),
                            Constant().txt2(
                              "1 Month ago",
                              fsize: 12,
                              txtColor: Color(0xff7f7f7f),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 18),
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 16,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(
                fontSize: 14,
                overflow: TextOverflow.clip,
              ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _reviewBox() {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/images/elp.png"),
                  width: 40,
                  height: 40,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Constant().txt2(
                          "Madelina",
                          fsize: 16,
                        ),
                        Constant().txt2(
                          "1 Month ago",
                          fsize: 12,
                          txtColor: Color(0xff7f7f7f),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    child: RatingBar.builder(
                      initialRating: 4,
                      minRating: 4,
                      maxRating: 4,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 16,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget tabView() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Constant().txt("Overview", fsize: 16, fweight: FontWeight.w400),
          Constant().txt("Description", fsize: 16, fweight: FontWeight.w400),
          Constant().txt("Review", fsize: 16, fweight: FontWeight.w400),
        ],
      ),
    );
  }
}

final List<String> imgList = [
  'assets/images/poster.png',
  'assets/images/poster.png',
  'assets/images/poster.png',
  'assets/images/poster.png',
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                )),
          ),
        ))
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.6,
      child: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
