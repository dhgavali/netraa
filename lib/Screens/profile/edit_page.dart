import 'package:flutter/material.dart';
import 'package:uidesign/shared/constants.dart';

class EditProfileDetails extends StatefulWidget {
  final String full_name;
  final String mobile;
  final String email;
  final String gender;
  final String dob;
  final String location;
  final String alter_mob;

  EditProfileDetails({
    required this.full_name,
    required this.mobile,
    required this.email,
    required this.gender,
    required this.dob,
    required this.location,
    required this.alter_mob,
  });
  @override
  State<EditProfileDetails> createState() => _EditProfileDetailsState();
}

class _EditProfileDetailsState extends State<EditProfileDetails> {
  TextEditingController nameCont = new TextEditingController();
  TextEditingController mobCont = new TextEditingController();
  TextEditingController emailCont = new TextEditingController();
  TextEditingController genderCont = new TextEditingController();
  TextEditingController dobCont = new TextEditingController();
  TextEditingController locationCont = new TextEditingController();
  TextEditingController alterMobCont = new TextEditingController();
  bool _gender = false;
  bool _gender1 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameCont.text = widget.full_name;
    mobCont.text = widget.mobile;
    emailCont.text = widget.email;
    genderCont.text = widget.gender;
    dobCont.text = widget.dob;
    locationCont.text = widget.location;
    alterMobCont.text = widget.alter_mob;

    widget.gender == "Male" ? _gender = true : _gender1 = true;
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
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cmInp(title: "Full Name", hint: "Full Name", txCont: nameCont),
              cmInp(title: "Mobile", hint: "Mobile Number", txCont: mobCont),
              cmInp(
                  title: "Alternate Mobile",
                  hint: "Mobile",
                  txCont: alterMobCont),
              cmInp(title: "Email ID", hint: "Email Id", txCont: emailCont),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                alignment: Alignment.topLeft,
                child: Text(
                  "Date of Birth",
                  style: TextStyle(
                    color: Color(0xff555555),
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        height: 50,
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
                          controller: dobCont,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Date of Birth',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onTap: () async {
                            var selecDate;
                            showDatePicker(
                                    context: context,
                                    initialDate: selecDate == null
                                        ? DateTime.now()
                                        : selecDate,
                                    firstDate: DateTime(1970),
                                    lastDate: DateTime(2023))
                                .then((date) {
                              String day, month, year;
                              day = date!.day.toString();
                              month = date.month.toString();
                              year = date.year.toString();
                              if (day.length < 2) {
                                day = '0$day';
                              }
                              if (month.length < 2) {
                                month = '0$month';
                              }
                              var sdate = '$day/$month/$year';

                              setState(() {
                                this.dobCont.text = sdate;
                              });
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Select a Date ';
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              cmInp(title: "Location", hint: "Location", txCont: locationCont),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                alignment: Alignment.topLeft,
                child: Text(
                  "Gender",
                  style: TextStyle(
                    color: Color(0xff555555),
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.black,
                            value: _gender,
                            onChanged: (value) {
                              this._gender = value!;
                              this._gender1 = false;
                              setState(() {});
                            },
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                              activeColor: Colors.black,
                              value: _gender1,
                              onChanged: (value) {
                                this._gender1 = value!;
                                this._gender = false;
                                setState(() {});
                              }),
                          Text(
                            "Female",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: newBtn("Cancel", Colors.white, Colors.black)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: newBtn("Update", Colors.black, Colors.white)),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

//Make t his in to constant
  Widget newBtn(String title, Color color, Color txt) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width * 0.37,
      child: Text(
        title,
        style: TextStyle(
            color: txt,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: color,
      ),
    );
  }

  //TODO : shift this to constant from the address
  Widget cmInp(
      {required String title,
      required String hint,
      required TextEditingController txCont}) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xff555555),
                fontSize: 16,
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
              controller: txCont,
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
