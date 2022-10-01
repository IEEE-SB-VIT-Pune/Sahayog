import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/widgets/Contact_Card.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h, w;
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts',
            style: GoogleFonts.montserrat(
                color: Colors.black, fontWeight: FontWeight.w700)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Container(
            height: 15 * h / 640,
          ),
          ContactCard(
              Name: "Ahana Singh", Number: "1234567890", Relation: "Daughter"),
          SizedBox(height: 20 * h / 640),
          ContactCard(
              Name: "Ahana Singh", Number: "1234567890", Relation: "Daughter"),
          SizedBox(
            height: 20 * h / 640,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.blue.shade900,
        ),
      ),
    );
  }
}
