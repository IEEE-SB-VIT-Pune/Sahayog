import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<List<Color>> cardsColor = [
  [Colors.red.shade100, Colors.pink.shade200],
  [Color.fromARGB(255, 158, 211, 160), Color.fromARGB(255, 124, 202, 128)],
  [Colors.blue.shade100, Colors.blue.shade300],
];

Widget EventCard(String Event, String About, String Location, String Time,
    int Colorpick, int BorderColor, int CardColor, ) {
  var h, w;
  // h = MediaQuery.of(context).size.height;
  // w = MediaQuery.of(context).size.width;

  return InkWell(
      child: Container(
    height: 500,
    margin: EdgeInsets.only(right: 10.0, left: 10.0),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3),
      )
    ], color: Color(0XffF9F6DF), borderRadius: BorderRadius.circular(10.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: cardsColor[Colorpick][CardColor],
          ),
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(Event,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 8,
                top: 8,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Color(0Xff7950F2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      Time,
                      style: GoogleFonts.lato(
                          fontSize: 14, color: Color(0Xff7950F2)),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
                bottom: 8,
                top: 8,
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on_sharp, color: Color(0Xff7950F2)),
                  Text(
                    Location,
                    style: GoogleFonts.lato(
                        fontSize: 14, color: Color(0Xff7950F2)),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'About the event:',
            style:
                GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 8),
          child: Text(
            About,
            style:
                GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10),
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0Xff7FB77E),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "Attend",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0XffFFFFFF)),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, bottom: 15),
              child: Text(
                "Sunita and 22 more are \nattending",
                style: GoogleFonts.monda(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            )
          ],
        ),
      ],
    ),
  ));
}
