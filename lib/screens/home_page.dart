import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ieee_app_project/screens/password.dart';
import 'package:ieee_app_project/screens/settings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    var h;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 136, 76, 214),
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

              // This trailing comma makes auto-formatting nicer for build methods.
            ]),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PasswordPage()));
          },
          label: Text("Settings"),
          icon: Icon(Icons.add),
        ));
  }
}

void _showdialogue(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to Logout?"),
          actions: [
            TextButton(onPressed: () => FirebaseAuth.instance.signOut(), child: Text("Yes")),
            TextButton(onPressed: () {}, child: Text("No")),
          ],
        );
      });
}
