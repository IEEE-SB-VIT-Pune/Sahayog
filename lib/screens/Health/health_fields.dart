import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/models/user_model.dart';
import 'package:ieee_app_project/screens/Health/health_page.dart';
import 'package:ieee_app_project/widgets/bottom_nav_bar.dart';

class HealthFields extends StatefulWidget {
  const HealthFields({super.key});

  @override
  State<HealthFields> createState() => _HealthFieldsState();
}

TextEditingController MedicineController = TextEditingController();
TextEditingController IntakeTimeController = TextEditingController();
TextEditingController Dosage1 = TextEditingController();
TextEditingController Dosage2 = TextEditingController();
TextEditingController Dosage3 = TextEditingController();
TextEditingController InstructionController = TextEditingController();

class _HealthFieldsState extends State<HealthFields> {
  final _auth = FirebaseAuth.instance;
  @override
  var h, s, w;

  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Health',
          style: GoogleFonts.montserrat(
              fontSize: 22 * w / 360,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => BottomNavBar())));
          },
          icon: FaIcon(
            FontAwesomeIcons.angleLeft,
            size: 25 * w / 360,
          ),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 39 * h / 640,
            ),
            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 78 * w / 360,
                ),
                Text(
                  "Name of Medicine",
                  style: GoogleFonts.poppins(
                      fontSize: 15 * w / 360,
                      fontWeight: FontWeight.w500,
                      color: Color(0Xff274B89)),
                ),
              ],
            )),
            Row(
              children: [
                SizedBox(
                  width: 36 * w / 360,
                ),
                Icon(
                  Icons.medical_information,
                  color: Color(0xff0C5DAD),
                  size: 25 * w / 360,
                ),
                SizedBox(
                  width: 14 * w / 360,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XffF9F8F8),
                  ),
                  height: 33 * h / 640,
                  width: 250 * w / 360,
                  child: TextField(
                    autofocus: false,
                    controller: MedicineController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(w / 30, w / 30, w / 20, w / 30),

                      // color: Color(0xff959595)),
                      // borderRadius: BorderRadius.circular(10 * w / 360)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 39 * h / 640,
            ),
            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 78 * w / 360,
                ),
                Text(
                  "Time of Intake",
                  style: GoogleFonts.poppins(
                      fontSize: 15 * w / 360,
                      fontWeight: FontWeight.w500,
                      color: Color(0Xff274B89)),
                ),
              ],
            )),
            Row(
              children: [
                SizedBox(
                  width: 36 * w / 360,
                ),
                Icon(
                  Icons.access_time_filled_rounded,
                  color: Color(0xff0C5DAD),
                  size: 25 * w / 360,
                ),
                SizedBox(
                  width: 14 * w / 360,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XffF9F8F8),
                  ),
                  height: 33 * h / 640,
                  width: 250 * w / 360,
                  child: TextField(
                    autofocus: false,
                    controller: IntakeTimeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(w / 30, w / 30, w / 20, w / 30),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 39 * h / 640,
            ),
            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 78 * w / 360,
                ),
                Text(
                  "Dosage",
                  style: GoogleFonts.poppins(
                      fontSize: 15 * w / 360,
                      fontWeight: FontWeight.w500,
                      color: Color(0Xff274B89)),
                ),
              ],
            )),
            Row(
              children: [
                SizedBox(
                  width: 36 * w / 360,
                ),
                Icon(
                  Icons.podcasts,
                  color: Color(0xff0C5DAD),
                  size: 25 * w / 360,
                ),
                SizedBox(
                  width: 14 * w / 360,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XffF9F8F8),
                  ),
                  height: 33 * h / 640,
                  width: 50 * h / 640,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: Dosage1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(w / 30, w / 30, w / 20, w / 30),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10 * w / 360,
                ),
                Container(
                  height: 5 * h / 640,
                  width: 19 * w / 360,
                  decoration: BoxDecoration(
                      color: Color(0xff959595),
                      borderRadius: BorderRadius.circular(2 * w / 360)),
                ),
                SizedBox(
                  width: 10 * w / 360,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XffF9F8F8),
                  ),
                  height: 33 * h / 640,
                  width: 50 * h / 640,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: Dosage2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(w / 30, w / 30, w / 20, w / 30),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10 * w / 360,
                ),
                Container(
                  height: 5 * h / 640,
                  width: 19 * w / 360,
                  decoration: BoxDecoration(
                      color: Color(0xff959595),
                      borderRadius: BorderRadius.circular(2 * w / 360)),
                ),
                SizedBox(
                  width: 10 * w / 360,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XffF9F8F8),
                  ),
                  height: 33 * h / 640,
                  width: 50 * h / 640,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLines: null,
                    controller: Dosage3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(w / 30, w / 30, w / 20, w / 30),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 39 * h / 640,
            ),
            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 78 * w / 360,
                ),
                Text(
                  "Additional Instructions",
                  style: GoogleFonts.poppins(
                      fontSize: 15 * w / 360,
                      fontWeight: FontWeight.w500,
                      color: Color(0Xff274B89)),
                ),
              ],
            )),
            Row(
              children: [
                SizedBox(
                  width: 36 * w / 360,
                ),
                Icon(
                  Icons.chat_bubble_rounded,
                  color: Color(0xff0C5DAD),
                  size: 25 * w / 360,
                ),
                SizedBox(
                  width: 14 * w / 360,
                ),
                Container(
                  height: 70 * h / 640,
                  width: 250 * w / 360,
                  decoration: BoxDecoration(
                      color: Color(0XffF9F8F8),
                      border: Border.all(color: Color(0xff959595)),
                      borderRadius: BorderRadius.circular(10 * w / 360)),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: InstructionController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.fromLTRB(w / 30, w / 30, w / 20, w / 30),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 39 * h / 640,
            ),
            InkWell(
              child: Container(
                  height: 41 * h / 640,
                  width: 101 * w / 360,
                  decoration: BoxDecoration(
                      color: Color(0Xff7FB77E),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Save",
                      style: GoogleFonts.montserrat(
                          fontSize: 20 * w / 360,
                          fontWeight: FontWeight.w700,
                          color: Color(0XffFFFFFF)),
                    ),
                  )),
              onTap: (() async {
                FirebaseFirestore firebaseFirestore =
                    FirebaseFirestore.instance;

                UserModel usm = UserModel();

                usm.medicineName = MedicineController.text;
                usm.timeOfIntake = IntakeTimeController.text;
                usm.Dosage1 = Dosage1.text;
                usm.Dosage2 = Dosage2.text;
                usm.Dosage3 = Dosage3.text;
                usm.instructions = InstructionController.text;

                await firebaseFirestore
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection("Health")
                    .add(usm.HealthMap())
                    .then((value) {
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("Health")
                      .get()
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HealthPage(
                                    HealthRef: value,
                                  ))));
                  Fluttertoast.showToast(
                      msg: "Health Information added successfully");
                }).catchError((error) =>
                        print("Failed to add Health Information $error"));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
