import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatefulWidget {
  final QueryDocumentSnapshot docE;
  ContactCard(this.docE);

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    var h, s, w;
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
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
                      SizedBox(width: 17 * w / 360),
                      Text(
                        widget.docE['emergencyName'],
                        style: GoogleFonts.montserrat(
                            fontSize: 22 * w / 360,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.edit, color: Color(0XffAC6A2C)),
                      Icon(Icons.delete, color: Color(0XffA01616)),
                      SizedBox(width: 17 * w / 360),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 13 * h / 640),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 17 * w / 360),
                      Icon(
                        Icons.phone,
                        size: 21 * w / 360,
                        color: Color(0Xff0C5DAD),
                      ),
                      SizedBox(
                        width: 11 * w / 360,
                      ),
                      Text(
                        widget.docE['phone'],
                        style: GoogleFonts.lato(
                            fontSize: 20 * w / 360,
                            color: Color(0Xff0C5DAD),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 8 * h / 640)
            ],
          )),
    );
  }
}
