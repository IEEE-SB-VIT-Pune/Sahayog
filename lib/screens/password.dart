import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController newpassEditingController = TextEditingController();
  TextEditingController oldpassEditingController = TextEditingController();
  TextEditingController confirmpassEditingController = TextEditingController();
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    void _togglePasswordView() {
      setState(() {
        _isHidden = !_isHidden;
      });
    }

    var h, w;
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    final oldpass = Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextFormField(
        obscureText: _isHidden,
        controller: oldpassEditingController,
        decoration: InputDecoration(
          suffix: InkWell(
              onTap: _togglePasswordView,
              child: Icon(_isHidden ? Icons.visibility : Icons.visibility_off)),
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onSaved: (String? value) {},
      ),
    );
    final newpass = Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextFormField(
        obscureText: _isHidden,
        controller: newpassEditingController,
        decoration: InputDecoration(
          suffix: InkWell(
              onTap: _togglePasswordView,
              child: Icon(_isHidden ? Icons.visibility : Icons.visibility_off)),
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onSaved: (String? value) {},
        validator: (String? value) {
          return (value != null && value.contains('@'))
              ? 'Do not use the @ char.'
              : null;
        },
      ),
    );
    final confirmpass = Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        obscureText: _isHidden,
        controller: confirmpassEditingController,
        decoration: InputDecoration(
          suffix: InkWell(
              onTap: _togglePasswordView,
              child: Icon(_isHidden ? Icons.visibility : Icons.visibility_off)),
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        //onSaved: (String? value) {},
        // validator: (value) {
        //   if (confirmpassEditingController.text !=
        //       newpassEditingController.text) {
        //     return "Password don't match";
        //   }
        //   return null;
        // },
        textInputAction: TextInputAction.next,
      ),
    );
    final saveButton = Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF7FB77E),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {},
          child: Text(
            "Save",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Password',
            style: GoogleFonts.montserrat(
                fontSize: w / 17,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: FaIcon(FontAwesomeIcons.angleLeft),
          color: Colors.black,
        ),
      ),
      body: Column(children: <Widget>[
        SizedBox(height: h / 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(h / 30, 0, 0, 0),
              child: Text(
                'Old Password',
                style: GoogleFonts.lato(fontSize: h / 42, color: Colors.black),
              ),
            ),
          ],
        ),
        oldpass,
        SizedBox(height: h / 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(h / 30, 0, 0, 0),
              child: Text(
                'New Password',
                style: GoogleFonts.lato(fontSize: h / 42, color: Colors.black),
              ),
            ),
          ],
        ),
        newpass,
        SizedBox(height: h / 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(h / 30, 0, 0, 0),
              child: Text(
                'Confirm New Password',
                style: GoogleFonts.lato(fontSize: h / 42, color: Colors.black),
              ),
            ),
          ],
        ),
        confirmpass,
        SizedBox(height: h / 40),
        saveButton
      ]),
    );
  }
}
