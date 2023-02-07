import 'package:flutter/material.dart';
import 'package:uidesign/shared/constants.dart';

class CartPayment extends StatefulWidget {
  @override
  State<CartPayment> createState() => _CartPaymentState();
}

class _CartPaymentState extends State<CartPayment> {
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
          "Payment",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            alignment: Alignment.center,
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Constant()
                        .txt("Cart", txtColor: Color(0xff09873A), fsize: 16),
                    Constant()
                        .txt("Address", txtColor: Color(0xff09873A), fsize: 16),
                    Constant()
                        .txt("Payment", txtColor: Color(0xff09873A), fsize: 16),
                  ],
                ),
              ),
              Constant().cSlider(100),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.centerLeft,
                child: Constant().txt(
                  "Payment Options",
                  fsize: 16,
                  fweight: FontWeight.w600,
                ),
              ),
              Container(
                child: ExpansionPanelList(
                  children: [
                    exPanel("Cash On Delivery", "Cash On Delivery"),
                    exPanel("Credit/Debit Card", "Credit/Debit Card"),
                    exPanel("PhonePe/Paytm/Google Pay/BHIM UPI",
                        "PhonePe/Paytm/Google Pay/BHIM UPI"),
                    exPanel("Wallets", "Wallets"),
                    exPanel("Net Banking", "Net Banking"),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(
                          text: "Price Details",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' (3 Items)',
                                style: TextStyle(color: Color(0xff555555))),
                          ],
                        ),
                      ),
                    ),
                    _txtPr("Total MRP", "Rs 2997"),
                    _txtPr("Discount MRP", "- Rs 900"),
                    _txtPr("Delivery", "FREE"),
                    Divider(
                      thickness: 2.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Constant().txt("Total Amount",
                              fsize: 16, fweight: FontWeight.bold),
                          Constant().txt("Rs 2097",
                              fsize: 16, fweight: FontWeight.bold),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ])),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 60,
        child: Constant().btnTwo(
            context: context,
            title: "Pay Now",
            onpress: () {
              // Navigator.push(context,
              //     CupertinoPageRoute(builder: (context) => CartPayment()));
            }),
      ),
    );
  }

  Widget _txtPr(String l1, String l2) {
    return Container(
      padding: EdgeInsets.only(
        right: 40,
        left: 20,
        top: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l1,
            style: TextStyle(color: Color(0xff555555)),
          ),
          Text(
            l2,
            style: TextStyle(color: Color(0xff555555)),
          ),
        ],
      ),
    );
  }

  ExpansionPanel exPanel(String title, String body) {
    return ExpansionPanel(
      body: ListTile(
        title: Text(title),
      ),
      headerBuilder: (context, isExpanded) {
        return ListTile(
          title: Constant().txt(title, fsize: 16, fweight: FontWeight.w700),
        );
      },
    );
  }
}

class OvalPainter extends CustomPainter {
  final paintConfig = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.red;

  @override
  void paint(Canvas canvas, Size size) {
    // Ellipse
    canvas.drawOval(const Rect.fromLTRB(50, 30, 10, 10), paintConfig);
    // Ellipse
    // canvas.drawOval(const Rect.fromLTWH(10, 10, 100, 200), paintConfig);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<League> data = <League>[
    League(
      'Premier League',
      <Club>[
        Club(
          'Liverpool',
          <Player>[
            Player('Virgil van Dijk'),
            Player('Mohamed Salah'),
            Player('Sadio Mané'),
          ],
        ),
        Club(
          'Manchester City',
          <Player>[
            Player('Kevin De Bruyne'),
            Player('Sergio Aguero'),
          ],
        ),
      ],
    ),
    League(
      'La Liga',
      <Club>[
        Club(
          'Real Madrid',
          <Player>[
            Player('Sergio Ramos'),
            Player('Karim Benzema'),
          ],
        ),
        Club(
          'Barcelona',
          <Player>[
            Player('Lionel Messi'),
          ],
        ),
      ],
    ),
    League(
      'Ligue One',
      <Club>[
        Club(
          'Paris Saint-Germain',
          <Player>[
            Player('Neymar Jr.'),
            Player('Kylian Mbappé'),
          ],
        ),
      ],
    ),
    League(
      'Bundeshliga',
      <Club>[
        Club(
          'Bayern Munich',
          <Player>[
            Player('Robert Lewandowski'),
            Player('Manuel Neuer'),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          MyExpandableWidget(data[index]),
      itemCount: data.length,
    );
  }
}

class MyExpandableWidget extends StatelessWidget {
  final League league;

  MyExpandableWidget(this.league);

  @override
  Widget build(BuildContext context) {
    if (league.listClubs.isEmpty)
      return ListTile(title: Text(league.leagueName));
    return ExpansionTile(
      key: PageStorageKey<League>(league),
      title: Text(league.leagueName,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent)),
      children:
          league.listClubs.map<Widget>((club) => showClubs(club)).toList(),
    );
  }
}

showClubs(Club club) {
  return new ExpansionTile(
    key: PageStorageKey<Club>(club),
    title: Text(
      club.clubName,
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.purpleAccent),
    ),
    children:
        club.listPlayers.map<Widget>((player) => showPlayers(player)).toList(),
  );
}

showPlayers(Player player) {
  return new ListTile(
    title: new Text(
      player.playerName,
      style: new TextStyle(fontSize: 20),
    ),
  );
}

class League {
  String leagueName;
  List<Club> listClubs;

  League(this.leagueName, this.listClubs);
}

class Club {
  String clubName;
  List<Player> listPlayers;

  Club(this.clubName, this.listPlayers);
}

class Player {
  String playerName;
  Player(this.playerName);
}
