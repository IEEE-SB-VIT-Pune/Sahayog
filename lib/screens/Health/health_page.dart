import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/screens/Health/health_fields.dart';
import 'package:ieee_app_project/widgets/bottom_nav_bar.dart';
import 'package:ieee_app_project/models/user_model.dart';

class HealthPage extends StatefulWidget {
  final QuerySnapshot HealthRef;
  const HealthPage({Key? key, required this.HealthRef}) : super(key: key);

  //  HealthPage(this.HealthRef);

  @override
  State<HealthPage> createState() => _HealthPageState();
}

List<QueryDocumentSnapshot> doc = [];

class _HealthPageState extends State<HealthPage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  var h, s, w;
  Widget build(BuildContext context) {
    doc = widget.HealthRef.docs.toList();

    UserModel loggedInUser = UserModel();

    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Health',
            style: GoogleFonts.montserrat(
                fontSize: 22 * w / 360,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => BottomNavBar())));
            },
            icon: FaIcon(
              FontAwesomeIcons.angleLeft,
              size: 21 * w / 360,
            ),
            color: Colors.black,
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [for (int i = 0; i < doc.length; i++) MedicineCard(doc[i])],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0Xff0C5DAD),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HealthFields()));
          },
          child: Icon(
            Icons.add,
            size: 25 * w / 360,
          ),
        ),
      );
    }
  }
}

class MedicineCard extends StatefulWidget {
  final QueryDocumentSnapshot doc;
  MedicineCard(this.doc);

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  @override
  var h, s, w;

  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    if (widget.doc['instructions'] == "") {
      return Padding(
          padding: EdgeInsets.only(
              top: 20 * h / 640, right: 20 * h / 640, left: 20 * h / 640),
          child: Container(
              width: 250 * w / 360,
              decoration: BoxDecoration(
                  color: Color(0XffF8F7F7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2 * w / 360,
                      blurRadius: 2 * w / 360,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10 * w / 360)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 8 * h / 640,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 9 * w / 360,
                            ),
                            Icon(
                              Icons.medication,
                              size: 21 * w / 360,
                              color: Color(0Xff0C5DAD),
                            ),
                            SizedBox(
                              width: 11 * w / 360,
                            ),
                            Text(
                              widget.doc['medicineName'],
                              style: GoogleFonts.montserrat(
                                  fontSize: 22 * w / 360,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Color(0XffAC6A2C),
                            ),
                            SizedBox(
                              width: 3 * w / 360,
                            ),
                            Icon(Icons.delete, color: Color(0XffA01616)),
                            SizedBox(
                              width: 9 * w / 360,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8 * h / 640,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 9 * w / 360,
                            ),
                            Icon(
                              Icons.access_time_filled_rounded,
                              size: 21 * w / 360,
                              color: Color(0Xff0C5DAD),
                            ),
                            SizedBox(
                              width: 11 * w / 360,
                            ),
                            Text(
                              widget.doc['timeOfIntake'],
                              style: GoogleFonts.lato(
                                  fontSize: 18 * w / 360,
                                  color: Color(0Xff0C5DAD),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(widget.doc['Dosage1'] + "  - ",
                                style: GoogleFonts.lato(
                                    fontSize: 18 * w / 360,
                                    color: Color(0Xff0C5DAD),
                                    fontWeight: FontWeight.bold)),
                            Text(widget.doc['Dosage2'] + "  - ",
                                style: GoogleFonts.lato(
                                    fontSize: 18 * w / 360,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text(widget.doc['Dosage3'],
                                style: GoogleFonts.lato(
                                    fontSize: 18 * w / 360,
                                    color: Color(0Xff0C5DAD),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 11 * w / 360,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10 * h / 640,
                    )
                  ])));
    } else {
      return Padding(
        padding: EdgeInsets.only(
            top: 20 * h / 640, right: 20 * h / 640, left: 20 * h / 640),
        child: Container(
          width: 200 * w / 360,
          decoration: BoxDecoration(
              color: Color(0XffF8F7F7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2 * w / 360,
                  blurRadius: 2 * w / 360,
                  offset: Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.circular(10 * w / 360)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 8 * h / 640,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 9 * w / 360,
                        ),
                        Icon(
                          Icons.medication,
                          size: 21 * w / 360,
                          color: Color(0Xff0C5DAD),
                        ),
                        SizedBox(
                          width: 11 * w / 360,
                        ),
                        Text(
                          widget.doc['medicineName'],
                          // "Crocein",
                          style: GoogleFonts.montserrat(
                              fontSize: 22 * w / 360,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Color(0XffAC6A2C),
                        ),
                        SizedBox(
                          width: 3 * w / 360,
                        ),
                        Icon(Icons.delete, color: Color(0XffA01616)),
                        SizedBox(
                          width: 9 * w / 360,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 8 * h / 640,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 9 * w / 360,
                        ),
                        Icon(
                          Icons.access_time_filled_rounded,
                          size: 21 * w / 360,
                          color: Color(0Xff0C5DAD),
                        ),
                        SizedBox(
                          width: 11 * w / 360,
                        ),
                        Text(
                          widget.doc['timeOfIntake'],
                          style: GoogleFonts.lato(
                              fontSize: 18 * w / 360,
                              color: Color(0Xff0C5DAD),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.doc['Dosage1'] + "  - ",
                            style: GoogleFonts.lato(
                                fontSize: 18 * w / 360,
                                color: Color(0Xff0C5DAD),
                                fontWeight: FontWeight.bold)),
                        Text(widget.doc['Dosage2'] + "  - ",
                            style: GoogleFonts.lato(
                                fontSize: 18 * w / 360,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(widget.doc['Dosage3'],
                            style: GoogleFonts.lato(
                                fontSize: 18 * w / 360,
                                color: Color(0Xff0C5DAD),
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 11 * w / 360,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 9 * w / 360,
                      left: 9 * w / 360,
                      top: 8 * h / 640,
                      bottom: 8 * h / 640),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1 * h / 640,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 8 * h / 640,
                          right: 8 * w / 360,
                          left: 8 * w / 360),
                      child: Text(
                        widget.doc['instructions'],

                        // "Take Before Food...",
                        style: GoogleFonts.montserrat(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            fontSize: 15 * w / 360),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      );
    }
  }
}
