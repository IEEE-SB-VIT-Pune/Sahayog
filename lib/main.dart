import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ieee_app_project/screens/home_page.dart';
import 'package:ieee_app_project/screens/news1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:ieee_app_project/screens/listEvent.dart';
import 'package:ieee_app_project/screens/slider1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Old Age Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [VerticalSlider(), HomePage(), AnnoucementsPage()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        //body: VerticalPages(),
        body: TabBarView(
          children: <Widget>[VerticalSlider(), HomePage(), AnnoucementsPage()],
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
          child: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Color.fromARGB(255, 6, 6, 6),
            labelStyle: TextStyle(fontSize: 10.0),
            indicator: UnderlineTabIndicator(),
            indicatorColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.calendar_month,
                  size: 24.0,
                ),
                text: 'Calendar',
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.house),
                text: 'Home',
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.bullhorn),
                text: 'Annoucements',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
