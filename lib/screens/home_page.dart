import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ieee_app_project/models/user_model.dart';
import 'package:ieee_app_project/screens/health_page.dart';
import 'package:ieee_app_project/screens/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/screens/login_page.dart';
import 'package:ieee_app_project/screens/password.dart';
import 'package:ieee_app_project/screens/settings.dart';
import 'package:ieee_app_project/widgets/bottom_nav_bar.dart';
import 'package:ieee_app_project/widgets/widgets_homepage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  var h, s, w;

  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0Xff0C5DAD),
          onPressed: () {
            FirebaseFirestore.instance
                .collection("users")
                .doc(user.uid)
                .collection("Health")
                .get()
                .then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HealthPage(
                              HealthRef: value,
                            ))));
          },
          label: Text("Settings"),
          icon: Icon(Icons.add),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(
              'Home',
              style: GoogleFonts.montserrat(
                  fontSize: 22 * w / 360,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              PopupMenuButton(
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.black,
                  size: 28 * w / 360,
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 1,
                      child: Text('My Account'),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Logout'),
                    )
                  ];
                },
                onSelected: (value) {
                  if (value == 1) {
                    ProfilePage();
                  } else if (value == 2) {
                    _showdialogue(context);
                  }
                },
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 16.0 * h / 640,
                ),
                child: QuoteCard(),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 27.0 * h / 640, bottom: 27 * h / 640),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EventCardHome("Common Area", "Houseful Evening", "04:00 PM",
                        "Get together with your buddies and enjoy your time..."),
                    Column(
                      children: [
                        MedicineCardHome("Milk", "8:00 AM"),
                        SizedBox(
                          height: 26 * h / 640,
                        ),
                        ContactWidget("Samarth", "9211420420")
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GradientCard(),
                  GradientCard(),
                ],
              )
            ],
          ),
        ));
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
                    MaterialPageRoute(builder: ((context) => BottomNavBar()))),
                child: Text("No")),
          ],
        );
      });
}
