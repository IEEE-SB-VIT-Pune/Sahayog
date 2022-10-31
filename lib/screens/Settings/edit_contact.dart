import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/models/user_model.dart';
import 'package:ieee_app_project/screens/Settings/Contact_page.dart';

class Contact_Edit extends StatefulWidget {
  String contact_Id;
  Contact_Edit({super.key, required this.contact_Id});

  @override
  State<Contact_Edit> createState() => _Contact_EditState();
}

class _Contact_EditState extends State<Contact_Edit> {
  final _auth = FirebaseAuth.instance;
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  List<String> relations = [
    'Relation',
    'Son',
    'Daughter',
    'Other'
  ]; // List with dropdown for relations
  String? selected = 'Relation'; //Default value for dropdown display

  @override
  Widget build(BuildContext context) {
    int contactIndex = 1;
    var h, w;
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Edit contact',
          style: GoogleFonts.montserrat(
              fontSize: w / 17,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: FaIcon(FontAwesomeIcons.angleLeft),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: EdgeInsets.all(h / 40)),
              Row(
                children: [
                  SizedBox(width: 30 * w / 360),
                  Icon(
                    Icons.person,
                    color: Color(0xff0C5DAD),
                    size: 28.5 * w / 360,
                  ),
                  SizedBox(width: 15 * w / 360),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XffFFFFFF),
                    ),
                    height: 53 * h / 640,
                    width: 250 * w / 360,
                    child: TextFormField(
                      // Field to enter name
                      controller: nameEditingController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Name",
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue.shade800),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h / 40),
              Row(
                children: [
                  SizedBox(width: 30 * w / 360),
                  Icon(
                    Icons.phone,
                    color: Color(0xff0C5DAD),
                    size: 28.5 * w / 360,
                  ),
                  SizedBox(width: 15 * w / 360),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XffFFFFFF),
                    ),
                    height: 53 * h / 640,
                    width: 250 * w / 360,
                    child: TextFormField(
                      //Field to enter phone number
                      controller: phoneEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Phone",
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue.shade800),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 40,
              ),
              SizedBox(
                  height: h / 20,
                  width: w / 2.5,
                  child: DropdownButtonFormField(
                      //Drop to select relation
                      value: selected,
                      onChanged: (item) => setState(() => selected = item),
                      items: relations
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade700))))
                          .toList(),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ))),
              SizedBox(
                height: h / 30,
              ),
              InkWell(
                child: Container(
                    height: 31 * h / 640,
                    width: 81 * w / 360,
                    decoration: BoxDecoration(
                        color: Color(0Xff7FB77E),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Edit",
                        style: GoogleFonts.montserrat(
                            fontSize: 20 * w / 360,
                            fontWeight: FontWeight.w700,
                            color: Color(0XffFFFFFF)),
                      ),
                    )),
                onTap: (() async {
                  FirebaseFirestore firebaseFirestore =
                      FirebaseFirestore.instance;
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("Contacts")
                      .doc(widget.contact_Id).update({
                    'emergencyName': nameEditingController.text,
                    'phone': phoneEditingController.text
                  });
                  FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection("Contacts")
                        .get()
                        .then((value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ContactsPage(ContactRef: value))));
                    Fluttertoast.showToast(msg: "Contact edited successfully");
                }),
              )
            ]),
      ),
    );
  }
}
