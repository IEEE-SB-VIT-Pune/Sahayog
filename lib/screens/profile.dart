import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/models/user_model.dart';
import 'package:ieee_app_project/screens/Profile_Display.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController yobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  List<String> menuItems = ['Gender', 'Male', 'Female', 'Other'];
  String? selectedValue = 'Gender';

  @override
  Widget build(BuildContext context) {
    var h, w;
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    Map<String, Icon> pairMap = {
      'Gender': Icon(
        Icons.transgender_sharp,
        color: Colors.blue.shade900,
      ),
      'Male': Icon(
        Icons.male_sharp,
        color: Colors.blue.shade900,
      ),
      'Female': Icon(
        Icons.female_sharp,
        color: Colors.blue.shade900,
      ),
      'Other': Icon(
        Icons.transgender_sharp,
        color: Colors.blue.shade900,
      ),
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: w / 15,
              fontWeight: FontWeight.w300),
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
                padding: EdgeInsets.only(left: w / 15, right: w / 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: h / 8, left: w / 4, bottom: h / 10)),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://picsum.photos/id/237/200/300'),
                            radius: 60 * w / 360,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 20,
                      ),
                      SizedBox(
                        height: h / 20,
                      ),
                      SizedBox(
                          height: h / 20,
                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person,
                                    color: Colors.blue.shade900),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Name",
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.blue.shade800),
                                    borderRadius: BorderRadius.circular(5))),
                          )),
                      SizedBox(height: h / 40),
                      SizedBox(
                        height: h / 20,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.blue.shade900,
                            ),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Email",
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      SizedBox(height: h / 40),
                      SizedBox(
                          height: h / 20,
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                icon: Icon(Icons.phone,
                                    color: Colors.blue.shade900),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Phone",
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                focusColor: Colors.blue.shade900),
                          )),
                      SizedBox(height: h / 40),
                      Row(
                        children: [
                          SizedBox(
                            height: h / 22,
                            width: w / 4.5,
                            child: TextFormField(
                              controller: dobController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.calendar_month,
                                      color: Colors.blue.shade900),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "DD",
                                  contentPadding: EdgeInsets.only(left: w / 32),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  focusColor: Colors.blue.shade900),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: w / 50)),
                          SizedBox(
                            height: h / 22,
                            width: w / 20,
                            child: Text(
                              '-',
                              style: TextStyle(
                                  fontSize: h / 25,
                                  color: Colors.grey.shade600),
                            ),
                          ),
                          SizedBox(
                            height: h / 22,
                            width: w / 8,
                            child: TextFormField(
                              controller: mobController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "MM",
                                  contentPadding: EdgeInsets.only(left: w / 38),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: w / 50)),
                          SizedBox(
                            height: h / 22,
                            width: w / 20,
                            child: Text(
                              '-',
                              style: TextStyle(
                                  fontSize: h / 25,
                                  color: Colors.grey.shade600),
                            ),
                          ),
                          SizedBox(
                            height: h / 22,
                            width: w / 7,
                            child: TextFormField(
                              controller: yobController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "YYYY",
                                  contentPadding: EdgeInsets.only(left: w / 40),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: h / 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: h / 20,
                              child: pairMap[selectedValue.toString()]),
                          Padding(padding: EdgeInsets.only(left: w / 24)),
                          SizedBox(
                              height: h / 22,
                              width: w / 2.5,
                              child: DropdownButtonFormField(
                                  value: selectedValue,
                                  onChanged: (item) =>
                                      setState(() => selectedValue = item),
                                  items: menuItems
                                      .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(item,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      Colors.grey.shade700))))
                                      .toList(),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ))),
                        ],
                      ),
                      SizedBox(height: h / 20),
                      SizedBox(
                          height: h / 20,
                          width: h / 0.5,
                          child: Center(
                              child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple.shade500,
                                minimumSize: const Size.fromWidth(100),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: (() async {
                              FirebaseFirestore firebaseFirestore =
                                  FirebaseFirestore.instance;
                              User? user = _auth.currentUser;

                              UserModel usm = UserModel();

                              usm.name = nameController.text;
                              usm.phone = phoneController.text;
                              usm.dob = dobController.text;
                              usm.mob = mobController.text;
                              usm.yob = yobController.text;
                              usm.gender = genderController.text;

                              await firebaseFirestore
                                  .collection("users")
                                  .doc(user!.uid)
                                  .collection("User Details")
                                  .doc(user.uid)
                                  .set(usm.userMap())
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileDisplay()));
                                Fluttertoast.showToast(
                                    msg:
                                        "Profile Information added successfully");
                              }).catchError((error) => print(
                                      "Failed to add Health Information $error"));
                            }),
                            child: Text(
                              "Save",
                              style: GoogleFonts.montserrat(),
                            ),
                          ))),
                      SizedBox(height: h / 20),
                    ])),
          )
        ],
      ),
    );
  }
}
