import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/event_card.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Container(
          height: 50,
        ),
        EventCard(
            "Housefull Evening",
            'Get together with your buddies and enjoy your time with a little competitive spirit. ',
            "Common Area ",
            "4:00 pm",
            1,
            0,
            1,
            context),
        EventCard(
            "Karaoke Session",
            'Vibe to the old songs and Live the Kishor Kumar era again.Find your Inner Voice! ',
            "Inox ",
            "7:00 pm",
            0,
            0,
            1,
            context),
        EventCard(
            "Karaoke Session",
            'Vibe to the old songs and Live the Kishor Kumar era again.Find your Inner Voice! ',
            "Inox ",
            "7:00 pm",
            0,
            0,
            1,
            context),
      ]);
}
