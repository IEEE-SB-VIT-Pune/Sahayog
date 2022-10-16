import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/models/user_model.dart';

import 'Profile_Display.dart';

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
  List<String> menuItems = [
    'Gender',
    'Male',
    'Female',
    'Other'
  ]; // List of the dropdown menu items
  String? selectedValue =
      'Gender'; // By default value displayed on the dropdown

  @override
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
        size: 25*w/360,
      ),
      'Male': Icon(
        Icons.male_sharp,
        color: Colors.blue.shade900,
        size: 25*w/360,
      ),
      'Female': Icon(
        Icons.female_sharp,
        size: 25*w/360,
        color: Colors.blue.shade900,
      ),
      'Other': Icon(
        Icons.transgender_sharp,
        size: 25*w/360,
        color: Colors.blue.shade900,
      ),
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
              fontSize: 22 * w / 360,
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
          icon: FaIcon(FontAwesomeIcons.angleLeft,size: 25*w/360,),
          color: Colors.black,
        ),
      ),
      body: 
          
          SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/id/237/200/300'),
                    radius: 60 * w / 360,
                  ),
                  
                  Container(
                    child: TextFormField(
                      //Field to enter name
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person,
                          size: 25*w/360,
                              color: Colors.blue.shade900),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Name",
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.blue.shade800),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                 
                  Container(
                    child: TextFormField(
                      //Field to enter email
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.mail,
                          size: 25*w/360,
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
                  Container(
                      child: TextFormField(
                        //Field to enter phone number
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone,
                            
                            size: 25*w/360,
                                color: Colors.blue.shade900),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Phone",
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            focusColor: Colors.blue.shade900),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: w / 4.5,
                        child: TextFormField(
                          //Field to enter date of birth
                          controller: dobController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_month,
                                                              size: 25*w/360,
          
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
                      
                      // -
                      Container(
                        height: h / 22,
                        width: w / 8,
                        child: TextFormField(
                          //Field to enter month of birth
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
                      // -
                      Container(
                        height: h / 22,
                        width: w / 7,
                        child: TextFormField(
                          //Field to enter year of birth
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: h / 20,
                          child: pairMap[selectedValue.toString()]),
                      Container(
                          width: w / 2.5,
                          child: DropdownButtonFormField(
                              //Dropdown box to select gender
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
                  Container(
                      width: h / 0.5,
                      child: Center(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF7FB77E),
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
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ))),
                ]),
          )
    );
  }
}
