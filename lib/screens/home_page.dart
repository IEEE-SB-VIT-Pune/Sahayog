import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: (Center(child: Text('Home', style: TextStyle(fontSize: h / 20)))),
    );
  }
}
