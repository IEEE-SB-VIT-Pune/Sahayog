import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/widgets/bottom_nav_bar.dart';

class HealthFields extends StatefulWidget {
  const HealthFields({super.key});

  @override
  State<HealthFields> createState() => _HealthFieldsState();
}

TextEditingController MedicineController = TextEditingController();

class _HealthFieldsState extends State<HealthFields> {
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
            size: 21 * w / 360,
          ),
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Container(
              child: Text(
            "Name of Medicine",
            style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0Xff274B89)),
          )),
          Row(
            children: [
              Icon(Icons.medical_information),
              Container(
                
                decoration: BoxDecoration(color: Color(0XffF9F8F8),),
                height: 33*h/640,
                width: 250*w/360,
                child: TextField(
                  autofocus: false,
                  controller: MedicineController,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                  // color: Color(0xff959595)),
// borderRadius: BorderRadius.circular(10 * w / 360)),
                ),
              ),
              )
            ],)
        ],
      ),
    );
  }
}
