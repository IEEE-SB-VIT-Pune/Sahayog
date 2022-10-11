import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/screens/contact_add.dart';
import 'package:ieee_app_project/widgets/Contact_Card.dart';

class ContactsPage extends StatefulWidget {
  final db = FirebaseFirestore.instance;

  ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts',
            style: GoogleFonts.montserrat(
                color: Colors.black, fontWeight: FontWeight.w700)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("Contacts")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return ListView(
                children: snapshot.data!.docs
                    .map((Contacts) => ContactCard(Contacts))
                    .toList(),
              );
            } 
              return Text(
                "There are no notes",
                style: GoogleFonts.nunito(color: Colors.white),
              );
            
          }),
          floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Contact_Add()));
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.blue.shade900,
        ),
      ),
    );
  }
}
