import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                primary: Color.fromARGB(255, 136, 76, 214),
                onPrimary: Colors.white,
                onSurface: Color.fromARGB(255, 0, 0, 0),
              )),
              child: child!,
            );
          });
    }

    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Events',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 136, 76, 214),
        actions: <Widget>[
          Container(
            child: IconButton(
              onPressed: () {
                DatePick();
              },
              icon: FaIcon(FontAwesomeIcons.calendarDays),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
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
        ],
      ),
    );
  }
}
