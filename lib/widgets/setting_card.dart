import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingCard extends StatelessWidget {
  String title = "";
  final IconData icon;
  SettingCard(
      {required this.title, required this.icon}); //parameterised icon and title

  @override
  Widget build(BuildContext context) {
    var h, w;
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(h / 22, h / 40, h / 22, h / 40),
      child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: w / 45),
              Icon(
                icon,
                size: w / 12.5,
                color: Color(0xFF0C5DAD),
              ),
              SizedBox(
                width: w / 20,
              ),
              Container(
                width: 170 * w / 340,
                child: Text(title,
                    style: GoogleFonts.poppins(
                        fontSize: w / 24, fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                width: w / 25,
              ),
              Icon(Icons.arrow_forward_ios, size: w / 17),
              SizedBox(
                width: w / 45,
              )
            ],
          ),
          height: h / 17,
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
            color: Colors.white,
          )),
    );
  }
}
