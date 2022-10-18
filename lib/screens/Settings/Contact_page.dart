import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/models/user_model.dart';
import 'package:ieee_app_project/screens/Settings/add_contact.dart';
import 'package:ieee_app_project/widgets/contact-card.dart';

class ContactsPage extends StatefulWidget {
  final QuerySnapshot ContactRef;
  const ContactsPage({Key? key, required this.ContactRef}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

List<QueryDocumentSnapshot> docE = [];

class _ContactsPageState extends State<ContactsPage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  var s, h, w;
  Widget build(BuildContext context) {
    docE = widget.ContactRef.docs.toList();

    UserModel loggedInUser = UserModel();
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts',
            style: GoogleFonts.montserrat(
                color: Colors.black, fontWeight: FontWeight.w700)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(children: [
        for (int i = 0; i < docE.length; i++) ContactCard(docE[i])
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Contact_Add()));
        },
        backgroundColor: Colors.black,
        label: Text("Add Contacts"),
        icon: Icon(
          Icons.add,
          color: Colors.blue.shade900,
        ),
      ),
    );
  }
}
