import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/models/user_model.dart';
import 'package:ieee_app_project/screens/Settings/Contact_page.dart';
import 'package:ieee_app_project/screens/Settings/Profile_Display.dart';
import 'package:ieee_app_project/screens/UserAuth/login_page.dart';
import 'package:ieee_app_project/widgets/setting_card.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        .get() //reads document
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
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        title: Text('Settings',
            style: GoogleFonts.montserrat(
                fontSize: w / 17,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(h / 32, h / 30, h / 32, h / 38),
              child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(h / 95),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: w / 2.8,
                              child: Text(
                                "${loggedInUser.name}", //fetches name of logged in user
                                style: GoogleFonts.poppins(
                                    fontSize: w / 23,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  child: Text("View Profile >",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w400,
                                          fontSize: h / 60,
                                          color: Color(0xFF3780CB))),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileDisplay())); //navigates to profile details page
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/id/237/200/300'),
                          radius: 30 * w / 360,
                        )
                      ],
                    ),
                  ),
                  width: w / 1.65,
                  height: w / 4.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * w / 360),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: w / 90,
                        blurRadius: w / 110,
                        offset: Offset(0, w / 130),
                      )
                    ],
                    color: Colors.white,
                  )),
            ),
            InkWell(
              child: SettingCard(
                  title: "Emergency Contact", icon: Icons.local_hospital),
              onTap: () {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection("Contacts")
                    .get()
                    .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactsPage(
                                  ContactRef: value,
                                ))));
              },
            ),
            SettingCard(title: "Language", icon: Icons.language_outlined),
            SettingCard(title: "Feedback", icon: Icons.feedback_rounded),
            SettingCard(title: "Privacy Policy", icon: Icons.book_online),
            SettingCard(title: "Terms of Service", icon: Icons.policy_rounded),
            Padding(
              padding: EdgeInsets.only(
                  right: 13 * w / 360,
                  left: 13 * w / 360,
                  bottom: 10 * h / 640),
              child: Divider(
                color: Color(0xFFC3BFBF),
                thickness: 2 * h / 640,
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () => _showdialogue(context),
                  child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(width: 40 * w / 360),
                          FaIcon(
                            FontAwesomeIcons.rightFromBracket,
                            color: Color(0xFFFFFFFF),
                          ),
                          SizedBox(width: 27 * w / 360),
                          Text("Log out",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: w / 24,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      height: h / 19,
                      width: w / 1.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * w / 360),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: w / 90,
                            blurRadius: w / 110,
                            offset: Offset(0, w / 150),
                          )
                        ],
                        color: Color(0xFFD82828),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showdialogue(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to Logout?"),
          actions: [
            TextButton(
                onPressed: () => FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => LoginPage())))),
                child: Text("Yes")),
            TextButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => SettingsPage()))),
                child: Text("No")),
          ],
        );
      });
}
