import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/screens/contact_add.dart';
import 'package:ieee_app_project/widgets/Contact_Card.dart';

class ContactPage extends StatefulWidget {
  final QuerySnapshot Emergency;
  ContactPage(this.Emergency);
  @override
  State<ContactPage> createState() => _ContactPageState();
}

List<QueryDocumentSnapshot> docsListG = [];

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    docsListG = widget.Emergency.docs.toList();
    var h;
    h = MediaQuery.of(context).size.height;

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
          for (int i = 0; i < docsListG.length; i++) ContactCard(docsListG[i]),
          // StreamBuilder<QuerySnapshot>(
          //     stream: FirebaseFirestore.instance
          //         .collection("users")
          //         .doc("fWjEFL0FaJQDGaf9rF4xVmC1RRr2")
          //         .collection("Contacts")
          //         .snapshots(),
          //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //       if (snapshot.hasData) {
          //         return GridView(
          //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //                 crossAxisCount: 1),
          //             children: snapshot.data!.docs
          //                 .map((Contacts) => ContactCard(Contacts))
          //                 .toList());
          //       }

          //   return Text(
          //     "There are no notes",
          //     style: GoogleFonts.nunito(color: Colors.white),
          //   );
          // }),
          // ContactCard(
          //     Name: "Ahana Singh", Number: "1234567890", Relation: "Daughter"),
          // SizedBox(height: 20 * h / 640),
          // ContactCard(
          //     Name: "Ahana Singh", Number: "1234567890", Relation: "Daughter"),
          SizedBox(
            height: 20 * h / 640,
          ),
        ],
      ),
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
