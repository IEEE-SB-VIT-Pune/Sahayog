import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/Settings/Contact_page.dart';
import '../screens/Settings/edit_contact.dart';

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
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: (() {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Contact_Edit(
                                        contact_Id: widget.docE.id)));
                          })),
                      IconButton(
                        icon: Icon(Icons.delete, color: Color(0XffA01616)),
                        onPressed: () async {
                          var _contactsData = await FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection("Contacts");
                          _contactsData.doc(widget.docE.id).delete();
                          setState(() {
                            _contactsData.get().then((value) =>
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ContactsPage(ContactRef: value))));
                          });
                        },
                      ),
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
                      InkWell(
                        onTap: phoneCall,
                        child: Text(
                          widget.docE['phone'],
                          style: GoogleFonts.lato(
                              fontSize: 20 * w / 360,
                              color: Color(0Xff0C5DAD),
                              fontWeight: FontWeight.bold),
                        ),
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
