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
            Event: "Housefull Evening",
            About: 'Get together with your buddies and enjoy your time with a little competitive spirit. ',
            Location: "Common Area ",
            Time: "4:00 pm",
            Colorpick:1,
            BorderColor:0,
            CardColor:1,
            ),
        EventCard(
            Event: "Karaoke Session",
            About: 'Vibe to the old songs and Live the Kishor Kumar era again.Find your Inner Voice! ',
            Location: "Inox ",
            Time: "7:00 pm",
            Colorpick:0,
            BorderColor:0,
            CardColor:1,
            ),
        EventCard(
            Event:"Karaoke Session",
            About:'Vibe to the old songs and Live the Kishor Kumar era again.Find your Inner Voice! ',
            Location:"Inox ",
            Time:"7:00 pm",
            Colorpick:0,
            BorderColor:0,
            CardColor:1,
            ),
      ]);
}
