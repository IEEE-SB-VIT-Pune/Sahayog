import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCreate extends StatefulWidget {
  const ProfileCreate({super.key});

  @override
  State<ProfileCreate> createState() => _ProfileCreateState();
}

class _ProfileCreateState extends State<ProfileCreate> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController yobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h, w;
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

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
          icon: FaIcon(
            FontAwesomeIcons.angleLeft,
            size: 25 * w / 360,
          ),
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage:
                NetworkImage('https://picsum.photos/id/237/200/300'),
            radius: 60 * w / 360,
          ),
          Center(
            child: Text("Change Image",
                style: GoogleFonts.lato(
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w700,
                    fontSize: w / 24)),
          ),
          Row(
            children: [
              SizedBox(
                width: 36 * w / 360,
              ),
              Icon(
                Icons.person,
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
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
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
          Row(
            children: [
              SizedBox(
                width: 36 * w / 360,
              ),
              Icon(
                Icons.mail,
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
                  decoration: InputDecoration(
                    hintText: "Email",
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
          Row(
            children: [
              SizedBox(
                width: 36 * w / 360,
              ),
              Icon(
                Icons.phone,
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
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Phone",
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
          Row(
            children: [
              SizedBox(
                width: 36 * w / 360,
              ),
              Icon(
                Icons.calendar_month,
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
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
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
         
          
        ],
      ),
    );
  }
}
