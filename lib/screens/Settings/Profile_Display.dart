import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/models/user_model.dart';
import 'package:ieee_app_project/screens/Settings/Profile_Create.dart';
import 'package:ieee_app_project/screens/Settings/password.dart';
import 'package:ieee_app_project/screens/Settings/profile.dart';

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
        .collection("User Details")
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

    Map<String, Icon> pairMap = {
      // The given map pairs string and icon
      'Gender': Icon(
        // it changes the icon according to the string choosen
        Icons.transgender_sharp,
        color: Colors.blue.shade900,
        size: w / 12,
      ),
      'Male': Icon(
        Icons.male_sharp,
        color: Colors.blue.shade900,
        size: w / 12,
      ),
      'Female': Icon(
        Icons.female_sharp,
        color: Colors.blue.shade900,
        size: w / 12,
      ),
      'Other': Icon(
        Icons.transgender_sharp,
        color: Colors.blue.shade900,
        size: w / 12,
      ),
    };

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.montserrat(
                fontSize: w / 17,
                color: Colors.black,
                fontWeight: FontWeight.w600),
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
        body: Stack(
          children: [
            Container(),
            SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                    left: w / 15,
                    right: w / 8,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: h / 10, left: w / 4, bottom: h / 10)),
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
                                "${loggedInUser.name}", // Displays Name stored in firebase console
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
                            Text(
                                FirebaseAuth.instance.currentUser!
                                    .email // Displays Email of the current user
                                    .toString(),
                                style: GoogleFonts.lato(
                                    color: Colors.black, fontSize: w / 20))
                          ],
                        ),
                        SizedBox(height: h / 40),
                        Row(
                          children: [
                            SizedBox(height: h / 20),
                            Icon(
                              Icons.phone,
                              color: Colors.blue.shade900,
                              size: w / 12,
                            ),
                            SizedBox(width: w / 24),
                            Text(
                                "${loggedInUser.phone}", // Displays Phone Number stored in firebase console
                                style: GoogleFonts.lato(
                                    color: Colors.black, fontSize: w / 20))
                          ],
                        ),
                        SizedBox(height: h / 40),
                        Row(
                          children: [
                            SizedBox(height: h / 20),
                            Icon(
                              Icons.calendar_month,
                              color: Colors.blue.shade900,
                              size: w / 12,
                            ),
                            SizedBox(width: w / 24),
                            Text(
                                "${loggedInUser.dob}/${loggedInUser.mob}/${loggedInUser.yob}", // Displays Date Of Birth stored in firebase console
                                style: GoogleFonts.lato(
                                    color: Colors.black, fontSize: w / 20))
                          ],
                        ),
                        SizedBox(height: h / 40),
                        Row(
                          children: [
                            SizedBox(
                              height: h / 20,
                              child: pairMap[
                                  "${loggedInUser.gender}"], // Displays Icon according to the gender stored in firebase console
                              // color: Colors.blue.shade900,
                              // size: w / 12,
                            ),
                            SizedBox(width: w / 24),
                            Text(
                                "${loggedInUser.gender}", // Displays Gender stored in firebase console
                                style: GoogleFonts.lato(
                                    color: Colors.black, fontSize: w / 20))
                          ],
                        ),
                        SizedBox(
                          height: h / 20,
                          child: SizedBox(
                            child: Expanded(
                                child: Divider(
                                    color: Colors.grey.shade500, thickness: 2)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PasswordPage()));
                          },
                          child: Row(
                            children: [
                              SizedBox(height: h / 20),
                              Icon(
                                Icons.key,
                                color: Colors.blue.shade900,
                                size: w / 12,
                              ),
                              SizedBox(width: w / 24),
                              Text(
                                  "Change Password", // Navigates to the Change Password Page
                                  style: GoogleFonts.lato(
                                      color: Colors.blue.shade800,
                                      fontWeight: FontWeight.w700,
                                      fontSize: w / 24))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h / 50,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileCreate()));
                          },
                          child: Row(
                            children: [
                              SizedBox(height: h / 20),
                              Icon(
                                Icons.edit,
                                color: Colors.blue.shade900,
                                size: w / 12,
                              ),
                              SizedBox(width: w / 24),
                              Text(
                                  "Edit Profile", // Navigates to the Change Password Page
                                  style: GoogleFonts.lato(
                                      color: Colors.blue.shade800,
                                      fontWeight: FontWeight.w700,
                                      fontSize: w / 24))
                            ],
                          ),
                        ),
                      ])),
            )
          ],
        ));
  }
}
