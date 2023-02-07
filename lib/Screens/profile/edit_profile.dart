import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uidesign/Screens/profile/edit_page.dart';
import 'package:uidesign/shared/constants.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.topLeft,
              child: Constant().txt(
                "Profile Details",
                fsize: 18,
                fweight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Divider(
                color: Constant.klightGrey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              width: MediaQuery.of(context).size.width * 0.8,
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
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _dataRow("Full Name", "Name Name"),
                      _dataRow("Mobile", "9822322890"),
                      _dataRow("Email ID", "sample@gmail.com"),
                      _dataRow("Gender", "Male"),
                      _dataRow("Date of Birth", "03/04/2001"),
                      _dataRow("Location", "Patna, India"),
                      _dataRow("Alternate Mobile", "9875482102"),
                    ],
                  ),
                  Positioned(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileDetails(
                              full_name: "Name Name",
                              mobile: "9822322890",
                              email: "sample@gmail.com",
                              dob: "03/04/2001",
                              gender: "Male",
                              alter_mob: "9875482102",
                              location: "Patna, India",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: SvgPicture.asset(
                          "assets/icons/Vector.svg",
                          color: Color(0xff3A3A3A),
                          width: 18,
                        ),
                      ),
                    ),
                    right: 20,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              width: MediaQuery.of(context).size.width * 0.6,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
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
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xffF2DB69),
                        Color(0xffF0C26B),
                      ],
                    ),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dataRow(String ftitle, String stitle) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width * 0.5,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Constant().txt(
            ftitle,
            fsize: 14,
            fweight: FontWeight.w700,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Constant().txt(
              stitle,
              fsize: 14,
              txtColor: Color(0xff484848),
            ),
          ),
        ],
      ),
    );
  }
}
