import 'package:flutter/material.dart';
import 'package:uidesign/shared/constants.dart';

class AddressPage extends StatefulWidget {
  @override
  State<AddressPage> createState() => AddressPageState();
}

class AddressPageState extends State<AddressPage> {
  String _selectedState = "Andhra Pradesh";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Andhra Pradesh"), value: "Andhra Pradesh"),
      DropdownMenuItem(
          child: Text("Arunachal Pradesh"), value: "Arunachal Pradesh"),
      DropdownMenuItem(child: Text("Assam"), value: "Assam"),
      DropdownMenuItem(child: Text("Bihar"), value: "Bihar"),
      DropdownMenuItem(child: Text("Chhattisgarh"), value: "Chhattisgarh"),
      DropdownMenuItem(child: Text("Goa"), value: "Goa"),
      DropdownMenuItem(child: Text("Gujarat"), value: "Gujarat"),
      DropdownMenuItem(child: Text("Haryana"), value: "Haryana"),
      DropdownMenuItem(
          child: Text("Himachal Pradesh"), value: "Himachal Pradesh"),
      DropdownMenuItem(
          child: Text("Jammu and Kashmir"), value: "Jammu and Kashmir"),
      DropdownMenuItem(child: Text("Jharkhand"), value: "Jharkhand"),
      DropdownMenuItem(child: Text("Karnataka"), value: "Karnataka"),
      DropdownMenuItem(child: Text("Kerala"), value: "Kerala"),
      DropdownMenuItem(child: Text("Madhya Pradesh"), value: "Madhya Pradesh"),
      DropdownMenuItem(child: Text("Maharashtra"), value: "Maharashtra"),
      DropdownMenuItem(child: Text("Manipur"), value: "Manipur"),
      DropdownMenuItem(child: Text("Meghalaya"), value: "Meghalaya"),
      DropdownMenuItem(child: Text("Mizoram"), value: "Mizoram"),
      DropdownMenuItem(child: Text("Nagaland"), value: "Nagaland"),
      DropdownMenuItem(child: Text("Odisha"), value: "Odisha"),
      DropdownMenuItem(child: Text("Punjab"), value: "Punjab"),
      DropdownMenuItem(child: Text("Rajasthan"), value: "Rajasthan"),
      DropdownMenuItem(child: Text("Sikkim"), value: "Sikkim"),
      DropdownMenuItem(child: Text("Tamil Nadu"), value: "Tamil Nadu"),
      DropdownMenuItem(child: Text("Telangana"), value: "Telangana"),
      DropdownMenuItem(child: Text("Tripura"), value: "Tripura"),
      DropdownMenuItem(child: Text("Uttarakhand"), value: "Uttarakhand"),
      DropdownMenuItem(child: Text("Uttar Pradesh"), value: "Uttar Pradesh"),
      DropdownMenuItem(child: Text("West Bengal"), value: "West Bengal"),
      DropdownMenuItem(
          child: Text("Andaman and Nicobar Islands"),
          value: "Andaman and Nicobar Islands"),
      DropdownMenuItem(child: Text("Chandigarh"), value: "Chandigarh"),
      DropdownMenuItem(
          child: Text("Dadra and Nagar Haveli"),
          value: "Dadra and Nagar Haveli"),
      DropdownMenuItem(child: Text("Daman and Diu"), value: "Daman and Diu"),
      DropdownMenuItem(child: Text("Delhi"), value: "Delhi"),
      DropdownMenuItem(child: Text("Lakshadweep"), value: "Lakshadweep"),
      DropdownMenuItem(child: Text("Puducherry"), value: "Puducherry"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.maybePop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Address",
            style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              cmInp(title: "Full Name", hint: "Full Name"),
              cmInp(title: "Address", hint: "Address"),
              cmInp(title: "Apartment, House no. etc", hint: "123, Apartment"),
              cmInp(title: "City", hint: "City"),
              cmInp(title: "Pincode", hint: "Pincode"),
              // cmInp(title: "State", hint: "State"),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    text: "State" + " ",
                    style: TextStyle(color: Color(0xff555555)),
                    children: <TextSpan>[
                      TextSpan(
                          text: '*',
                          style: TextStyle(color: Color(0xffff0000))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(
                        1.0,
                        4.0,
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.8,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedState,
                  onChanged: (value) {
                    this._selectedState = value!;
                    setState(() {});
                  },
                  items: dropdownItems,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              cmInp(title: "Country", hint: "Country"),
              cmInp(title: "Save As", hint: "Home"),
              SizedBox(
                height: 20,
              ),
              Constant()
                  .loginBtn(context: context, title: "Save", onpress: () {}),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cmInp({required String title, required String hint}) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                text: title + " ",
                style: TextStyle(color: Color(0xff555555)),
                children: <TextSpan>[
                  TextSpan(
                      text: '*', style: TextStyle(color: Color(0xffff0000))),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(
                    1.0,
                    4.0,
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
            child: TextFormField(
              // validator: ,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
