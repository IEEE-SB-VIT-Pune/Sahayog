import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatefulWidget {
  final QueryDocumentSnapshot docE;
  ContactCard(this.docE);

  @override
  State<ContactCard> createState() => ContactCardState();
}

class ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    var h, s, w;
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    return InkWell(
      child: Column(
        children: [
          Container(
            // height: h / 9,
            margin: EdgeInsets.only(right: w / 20, left: w / 40),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 8 * h / 640,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: h / 20,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: w / 20, right: w / 40, top: h / 70),
                              child: Text(
                                widget.docE["emergencyName"],
                                style: GoogleFonts.lato(
                                    fontSize: 20 * w / 360,
                                    fontWeight: FontWeight.w700),
                              ),
                            )),
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
                        // Padding(padding: EdgeInsets.only(left: w / 3)),
                        // Icon(
                        //   Icons.edit,
                        //   color: Colors.red
                        //       .shade900, // Helps edit the contact information
                        // ),
                        // Padding(padding: EdgeInsets.all(3)),
                        // Icon(
                        //   Icons.delete,
                        //   color: Colors.red
                        //       .shade900, //Helps delete the contact information
                        // ),
                      ],
                    ),
                    Row(children: [
                      Padding(padding: EdgeInsets.only(right: w / 28)),
                      Icon(
                        Icons.phone,
                        color: Colors.blue.shade900,
                      ),
                      InkWell(
                        onTap:
                            phoneCall, // Calls the function to make a phone call
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            widget.docE["phone"],
                            style: GoogleFonts.lato(
                                fontSize: 18 * w / 360,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: w / 30)),
                    ]),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: h / 30)
        ],
      ),
    );
  }

  phoneCall() async {
    // Function to make a phone when pressed on the contact number
    var url = Uri.parse("tel:" + widget.docE["phone"]);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
