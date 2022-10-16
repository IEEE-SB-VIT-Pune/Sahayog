import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<List<Color>> cardsColor = [
  [Color(0xffFAF4B7), Color(0xffFAF4B7)],
  [Color(0xffFAF4B7), Color(0xffFAF4B7)],
  [Color(0xffFAF4B7), Color(0xffFAF4B7)],
];
class EventCard extends StatefulWidget {
  String Event = '';
  String About = '';
  String Location = '';
  String Time = '';
  
  int CardColor;
  EventCard(
      {required this.Event,
      required this.About,
      required this.Location,
      required this.Time,
      
      required this.CardColor});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    var h, w;
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Container(
      height: 300 * h / 640,
      margin: EdgeInsets.only(right: 10.0 * w / 360, left: 10.0 * w / 360),
      decoration: BoxDecoration(boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5 * w / 360,
      blurRadius: 7 * w / 360,
      offset: Offset(0, 3),
    )
      ], 
      color: Color(0XffF9F6DF), borderRadius: BorderRadius.circular(10.0)),
      child: Column(
    children: [
      Container(
        height: 35 * h / 640,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: cardsColor[widget.CardColor][widget.CardColor],
        ),
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.all(6.0 * w / 360),
          child: Center(
            child: Text(widget.Event,
                style: GoogleFonts.poppins(
                    fontSize: 20 * w / 360, fontWeight: FontWeight.w600)),
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 15 * w / 360,
                  bottom: 8 * h / 640,
                  top: 8 * h / 640,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Color(0Xff0C5DAD),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10 * w / 360),
                      child: Text(
                        widget.Time,
                        style: GoogleFonts.lato(
                            fontSize: 14 * w / 360, color: Color(0Xff0C5DAD)),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 15 * w / 360,
                  bottom: 8 * h / 640,
                  top: 8 * h / 640,
                ),
                child: Row(
                  children: [
                    Icon(Icons.location_on_sharp, color: Color(0Xff0C5DAD)),
                    Text(
                      widget.Location,
                      style: GoogleFonts.lato(
                          fontSize: 14 * w / 360, color: Color(0Xff0C5DAD)),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15 * w / 360),
            child: Text(
              'About the event:',
              style: GoogleFonts.openSans(
                  fontSize: 14 * w / 360, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left:15.0*w/360,bottom: 15.0*w/360),
            child: Text(
              widget.About,
              style: GoogleFonts.openSans(
                  fontSize: 14 * w / 360, fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0Xff7FB77E),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(6.0 * w / 360),
                  child: Text(
                    "Attend",
                    style: GoogleFonts.montserrat(
                        fontSize: 14 * w / 360,
                        fontWeight: FontWeight.w700,
                        color: Color(0XffFFFFFF)),
                  ),
                )),
          ),
        ],
      ),
    ],
      ),
    );
  }
}
