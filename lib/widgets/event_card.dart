import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<List<Color>> cardsColor = [
  [Colors.red.shade100, Colors.pink.shade200],
  [Color.fromARGB(255, 158, 211, 160), Color.fromARGB(255, 124, 202, 128)],
  [Colors.blue.shade100, Colors.blue.shade300],
];

class EventCard extends StatefulWidget {
  String Event = '';
  String About = '';
  String Location = '';
  String Time = '';
  int Colorpick;
  int BorderColor;
  int CardColor;
  EventCard(
      {required this.Event,
      required this.About,
      required this.Location,
      required this.Time,
      required this.Colorpick,
      required this.BorderColor,
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
    return InkWell(
        child: Container(
      height: 500 * h / 640,
      margin: EdgeInsets.only(right: 10.0 * w / 360, left: 10.0 * w / 360),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5 * w / 360,
          blurRadius: 7 * w / 360,
          offset: Offset(0, 3),
        )
      ], color: Color(0XffF9F6DF), borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50 * h / 640,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: cardsColor[widget.Colorpick][widget.CardColor],
            ),
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(6.0 * w / 360),
              child: Text(widget.Event,
                  style: GoogleFonts.poppins(
                      fontSize: 20 * w / 360, fontWeight: FontWeight.w600)),
            ),
          ),
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
                      color: Color(0Xff7950F2),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10 * w / 360),
                      child: Text(
                        widget.Time,
                        style: GoogleFonts.lato(
                            fontSize: 14 * w / 360, color: Color(0Xff7950F2)),
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
                    Icon(Icons.location_on_sharp, color: Color(0Xff7950F2)),
                    Text(
                      widget.Location,
                      style: GoogleFonts.lato(
                          fontSize: 14 * w / 360, color: Color(0Xff7950F2)),
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
            padding: EdgeInsets.only(left: 15 * w / 360, bottom: 8 * h / 640),
            child: Text(
              widget.About,
              style: GoogleFonts.openSans(
                  fontSize: 14 * w / 360, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0 * w / 360, bottom: 10 * h / 640),
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
              Padding(
                padding:
                    EdgeInsets.only(right: 15 * w / 360, bottom: 15 * h / 640),
                child: Text(
                  "Sunita and 22 more are \nattending",
                  style: GoogleFonts.monda(
                      fontWeight: FontWeight.w400,
                      fontSize: 11 * w / 360,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
