import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ieee_app_project/screens/Health/health_page.dart';
import 'package:ieee_app_project/widgets/bottom_nav_bar.dart';

class QuoteCard extends StatefulWidget {
  QuoteCard();

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  Future dayquote() async {
    List<Quote> quotes = [];
    var response = await http.get(Uri.https('zenquotes.io', '/api/today'));
    var jsonData = jsonDecode(response.body);
    for (var rquote in jsonData) {
      Quote quote = Quote(rquote['q'], rquote['a']);
      quotes.add(quote);
    }
    return quotes;
  }

  @override
  var h, s, w;

  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    return FutureBuilder(
        future: dayquote(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Container(
                width: 330 * w / 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * w / 360),
                  color: Color(0XffD8E5FB),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 16 * w / 360,
                      left: 16 * w / 360,
                      top: 8 * h / 640),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        snapshot.data[0].q,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.montserrat(
                            fontSize: 15 * w / 360,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('~ ' + snapshot.data[0].a,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                  fontSize: 15 * w / 360,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(
                        height: h / 70,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        }));
  }
}

class Quote {
  final String q, a;
  Quote(this.q, this.a);
  @override
  String toString() {
    return '{q: $q, a: $a}';
  }
}

class EventCardHome extends StatefulWidget {
  String eventText;
  String timing;
  String Location;
  String description;
  EventCardHome(this.Location, this.eventText, this.timing, this.description);

  @override
  State<EventCardHome> createState() => _EventCardHomeState();
}

class _EventCardHomeState extends State<EventCardHome> {
  @override
  var h, s, w;

  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    return Container(
      height: 170 * h / 640,
      width: 150 * w / 360,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10 * w / 360),
          border: Border.all(color: Color(0Xff3780CB), width: 4 * w / 360)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.eventText,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 17 * w / 360),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 9 * w / 360,
              ),
              Icon(
                Icons.access_time_filled_outlined,
                color: Color(
                  0XffAC6A2C,
                ),
                size: 20 * h / 640,
              ),
              SizedBox(
                width: 6 * w / 360,
              ),
              Text(
                // "04:00 PM",
                widget.timing,
                style: GoogleFonts.lato(
                  fontSize: 14 * w / 360,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 9 * w / 360,
              ),
              Icon(
                Icons.location_on_sharp,
                size: 20 * h / 640,
                color: Color(0XffAC6A2C),
              ),
              SizedBox(
                width: 6 * w / 360,
              ),
              Text(
                // "Common Area",
                widget.Location,
                style: GoogleFonts.lato(
                  fontSize: 14 * w / 360,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Text(
            // "Get together with your buddies and enjoy your time...",
            widget.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                fontSize: 13 * w / 360),
          )
        ],
      ),
    );
  }
}

class MedicineCardHome extends StatefulWidget {
  String medicine;
  String medTime;
  MedicineCardHome(this.medicine, this.medTime);

  @override
  State<MedicineCardHome> createState() => _MedicineCardHomeState();
}

class _MedicineCardHomeState extends State<MedicineCardHome> {
  @override
  var h, s, w;

  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    return Container(
      height: 72 * h / 640,
      width: 150 * w / 360,
      decoration: BoxDecoration(
          color: Color(0Xff274B89),
          borderRadius: BorderRadius.circular(10 * w / 360)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
              // "Paracetamol",
              widget.medicine,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18 * w / 360)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 12 * w / 360,
              ),
              Icon(
                Icons.access_time_filled_outlined,
                color: Colors.white,
                size: 20 * h / 640,
              ),
              SizedBox(
                width: 6 * w / 360,
              ),
              Text(
                // "04:00 PM",
                widget.medTime,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 14 * w / 360,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ContactWidget extends StatefulWidget {

 
  ContactWidget({Key? key, }) : super(key: key);
  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  var h, s, w;

  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    return Container(
      width: 150 * w / 360,
      height: 72 * h / 640,
      decoration: BoxDecoration(
          color: Color(0Xff6BB2E7),
          borderRadius: BorderRadius.circular(10 * w / 360)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Prashant Singh",
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18 * w / 360),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 12 * w / 360,
              ),
              Icon(
                Icons.phone,
                size: 20 * h / 640,
                color: Color(0Xff841313),
              ),
              SizedBox(
                width: 6 * w / 360,
              ),
              Text(
                // widget.docHomepage['emergencyName'],
                "8605194573",
                style: GoogleFonts.lato(
                  fontSize: 14 * w / 360,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class GradientCard extends StatefulWidget {
  const GradientCard({super.key});

  @override
  State<GradientCard> createState() => _GradientCardState();
}

class _GradientCardState extends State<GradientCard> {
  @override
  var h, s, w;

  Widget build(BuildContext context) {
      User? user = FirebaseAuth.instance.currentUser;

    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    return Container(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        
          Center(child: Text("Health", style: GoogleFonts.montserrat(fontSize:26*w/360,fontWeight: FontWeight.w600,color: Colors.white))),
          Padding(
            padding:  EdgeInsets.all(8.0*w/360),
            child: Text("Manage your Medicinal Intake and schedule important daily reminders.",textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize:20*w/360,fontWeight: FontWeight.w400,color: Colors.white)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
            FirebaseFirestore.instance
                .collection("users")
                .doc(user!.uid)
                .collection("Health")
                .get()
                .then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HealthPage(
                              HealthRef: value,
                            ))));
          },
                child: Text("Click Here!  ",textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize:20*w/360,fontWeight: FontWeight.w600,color: Colors.black))),
              Text("To manage your health",textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize:15*w/360,fontWeight: FontWeight.w400,color: Colors.white)),
            ],
          ),
          
        ],
      ),
      height: 170 * h / 640,
      width: 320 * w / 360,
      decoration: BoxDecoration(
        boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5*w/360),
                      spreadRadius: w / 90,
                      blurRadius: w / 110,
                      offset: Offset(0, w / 130),
                    ),
                    ],
        gradient: LinearGradient( 
          colors: [Color(0Xff274B89), Color(0xff6BB2E7)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          // tileMode: TileMode.repeated,
        ),
        borderRadius: BorderRadius.circular(10 * w / 360),
      ),
    );
  }
}
