import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/models/user_model.dart';

class Contact_Add extends StatefulWidget {
  const Contact_Add({super.key});

  @override
  State<Contact_Add> createState() => _Contact_AddState();
}

class _Contact_AddState extends State<Contact_Add> {
  final _auth = FirebaseAuth.instance;
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  List<String> relations = ['Relation', 'Son', 'Daughter', 'Other'];
  String? selected = 'Relation';

  @override
  Widget build(BuildContext context) {
    var h, w;
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add contact',
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: w / 15,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(w / 20),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.all(h / 40)),
                  SizedBox(
                    height: h / 20,
                    width: h / 3,
                    child: TextFormField(
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
                  SizedBox(height: h / 40),
                  SizedBox(
                    height: h / 20,
                    width: h / 3,
                    child: TextFormField(
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
                  SizedBox(
                    height: h / 40,
                  ),
                  SizedBox(
                      height: h / 20,
                      width: w / 2.5,
                      child: DropdownButtonFormField(
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
                    height: h / 40,
                  ),
                  SizedBox(
                      height: h / 20,
                      width: h / 0.5,
                      child: Center(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade500,
                            minimumSize: const Size.fromWidth(200),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: (() async {
                          FirebaseFirestore firebaseFirestore =
                              FirebaseFirestore.instance;
                          User? user = _auth.currentUser;

                          UserModel usm = UserModel();

                          usm.emergencyName = nameEditingController.text;
                          usm.phone = phoneEditingController.text;

                          await firebaseFirestore
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection("Contacts")
                              .add(usm.toMap())
                              .then((value) {
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                                msg: "Contact added successfully");
                          }).catchError((error) =>
                                  print("Failed to add a new contact $error"));
                        }),
                        child: Text("Save"),
                      ))),
                ],
              ),
            )
          ],
        ));
  }
}
