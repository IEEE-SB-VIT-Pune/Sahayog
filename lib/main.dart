import 'package:flutter/material.dart';
import 'package:ieee_app_project/screens/events_page.dart';
import 'package:ieee_app_project/screens/home_page.dart';
import 'package:ieee_app_project/screens/news_page.dart';

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
  final screens = [EventsPage(), HomePage(), NewsPage()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[EventsPage(), HomePage(), NewsPage()],
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xff112E6A),
          ),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xff87CDFF),
            labelStyle: TextStyle(fontSize: 10.0),
            indicator: UnderlineTabIndicator(),
            indicatorColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.announcement,
                  size: 24.0,
                ),
                text: 'Annoucements',
              ),
              Tab(
                icon: Icon(
                  Icons.home,
                  size: 28.0,
                ),
                text: 'Home',
              ),
              Tab(
                icon: Icon(
                  Icons.calendar_month,
                  size: 24.0,
                ),
                text: 'Calendar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
