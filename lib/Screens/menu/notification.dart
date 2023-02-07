import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notifs extends StatefulWidget {
  @override
  State<Notifs> createState() => _NotifsState();
}

class _NotifsState extends State<Notifs> {
  bool isVisible = true;

  Widget body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Image(
                  image: AssetImage(
                    "assets/images/notify_icon.jpg",
                  ),
                  width: 90,
                  height: 90,
                ),
              ),
              Expanded(
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Mega Sale ",
                        style:
                            TextStyle(color: Color(0xff222529), fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'HURRY UP!',
                              style: TextStyle(
                                  color: Color(0xff222529),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Text(
                      'Launching iPhone 16 on\n31st April 2022',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "2 Days Ago",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff9C9C9C),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10, right: 10),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/icons/trash.svg",
                  width: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
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
        title: Text(
          "Notification",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          body(),
        ],
      ),
    );
  }
}
