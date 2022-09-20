import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ieee_app_project/screens/listEvent.dart';
import 'package:ieee_app_project/widgets/event_card.dart';

class VerticalSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h, w;
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Events',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              // aspectRatio: w / 660,
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
