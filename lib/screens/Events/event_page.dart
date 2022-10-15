import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/screens/Events/listEvent.dart';

class VerticalSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatePick() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2022),
          lastDate: DateTime(2030),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                primary: Color(0xFF0C5DAD),
                onPrimary: Colors.black,
                onSurface: Color.fromARGB(255, 0, 0, 0),
              )),
              child: child!,
            );
          });
    }

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Events',
          style: GoogleFonts.montserrat(
              fontSize: 22 * w / 360,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            child: IconButton(
              onPressed: () {
                DatePick();
              },
              icon: FaIcon(FontAwesomeIcons.calendarDays, color: Colors.black),
            ),
          ),
        ],
      ),
      body: ListView(children: [
        CarouselSlider(
          options: CarouselOptions(
            height: h / 1.19,
            viewportFraction: 0.449,
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,
            autoPlay: false,
          ),
          items: EventCardList,
        ),
      ]),
    );
  }
}
