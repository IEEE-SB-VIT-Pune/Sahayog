import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieee_app_project/screens/password.dart';
import 'package:ieee_app_project/screens/settings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: (Center(child: Text('Home', style: TextStyle(fontSize: h / 20)))),
      appBar: AppBar(
          // title: Text('User Account'),
          elevation: 20,
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.account_circle_rounded),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Text('My Account'),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text('Logout'),
                  )
                ];
              },
              onSelected: (value) {
                if (value == 1) {
                } else if (value == 2) {
                  _showdialogue(context);
                }
              },
              // title: IconButton(
              //     onPressed: () => {}, icon: Icon(Icons.account_circle_rounded)),
            ),
          ]),
    );
  }
}

void _showdialogue(context) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to Logout?"),
          actions: [
            CupertinoDialogAction(onPressed: () {}, child: Text("Yes")),
            CupertinoDialogAction(onPressed: () {}, child: Text("No")),
          ],
        );
      });
}
