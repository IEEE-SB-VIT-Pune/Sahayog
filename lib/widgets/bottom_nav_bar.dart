import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ieee_app_project/models/user_model.dart';
import 'package:ieee_app_project/screens/Contact_page.dart';
import 'package:ieee_app_project/screens/contact_add.dart';
import 'package:ieee_app_project/screens/health_page.dart';
import 'package:ieee_app_project/screens/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ieee_app_project/screens/profile.dart';
import 'package:ieee_app_project/screens/settings.dart';


class BottomNavBar extends StatefulWidget {
    
   BottomNavBar();

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final screens = [SettingsPage(), HomePage(), ProfilePage()];
  var h, w;
    User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
        UserModel loggedInUser = UserModel();

     void getdata() async {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("Health")
          .doc("YU5UeBx4OvpaQNdmR7KB")
          .get()
          .then((value) {
        setState(() {
          loggedInUser = UserModel.fromMap(value.data());
        });
      });
      setState(() {});
    }
     void initState() {
      super.initState();
      getdata();
    }

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[SettingsPage(), HomePage(), ProfilePage()],
        ),
        bottomNavigationBar: Container(
          height: h / 12,
          decoration: BoxDecoration(
            boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5 * w / 360,
                      blurRadius: 2 * w / 360,
                      offset: Offset(0, 3),
                    ),],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(w / 15),
              topRight: Radius.circular(w / 15),
            ),
            color: Colors.white,
          ),
          child: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Color.fromARGB(255, 6, 6, 6),
            labelStyle: TextStyle(fontSize: w / 36),
            indicator: UnderlineTabIndicator(),
            indicatorColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.event_seat,
                    size: h / 23, color: Color(0xFF0C5DAD)),
                text: 'Events',
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.house,
                    size: h / 26, color: Color(0xFF0C5DAD)),
                text: 'Home',
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.bullhorn,
                    size: h / 26, color: Color(0xFF0C5DAD)),
                text: 'Annoucements',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
