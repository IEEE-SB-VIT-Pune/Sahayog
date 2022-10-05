import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/models/user_model.dart';

void main() {
  runApp(ProfileDisplay());
}

class ProfileDisplay extends StatefulWidget {
  const ProfileDisplay({super.key});

  @override
  State<ProfileDisplay> createState() => _ProfileDisplayState();
}

class _ProfileDisplayState extends State<ProfileDisplay> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      setState(() {
        loggedInUser = UserModel.fromMap(value.data());
      });
    });
    setState(() {});
  }

  Widget build(BuildContext context) {
    var h, w;
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.montserrat(
                fontSize: w / 17,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: h / 10, top: h / 5),
            ),
            SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(left: w / 15, right: w / 8, top: h / 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: w / 4),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://picsum.photos/id/237/200/300'),
                        radius: 60 * w / 360,
                      ),
                    ],
                  ),
                  SizedBox(height: h / 15),
                  SizedBox(
                    height: h / 20,
                    child: Row(
                      children: [
                        Icon(Icons.person,
                            color: Colors.blue.shade900, size: w / 12),
                        SizedBox(width: w / 24),
                        Text(
                          "${loggedInUser.name}",
                          style: GoogleFonts.lato(
                              color: Colors.black, fontSize: w / 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h / 40),
                  Row(
                    children: [
                      SizedBox(height: h / 20),
                      Icon(
                        Icons.mail,
                        color: Colors.blue.shade900,
                        size: w / 12,
                      ),
                      SizedBox(width: w / 24),
                      Text(FirebaseAuth.instance.currentUser!.email.toString(),
                          style: GoogleFonts.lato(
                              color: Colors.black, fontSize: w / 20))
                    ],
                  ),
                  SizedBox(height: h / 40),
                  SizedBox(
                      height: h / 20,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            icon:
                                Icon(Icons.phone, color: Colors.blue.shade900),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Phone",
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            focusColor: Colors.blue.shade900),
                      )),
                  SizedBox(height: h / 40),
                  SizedBox(
                    height: h / 22,
                    width: w / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_month,
                              color: Colors.blue.shade900),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Enter Date Of Birth",
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          focusColor: Colors.blue.shade900),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
