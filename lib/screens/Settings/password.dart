import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/screens/UserAuth/login_page.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController newpassEditingController = TextEditingController();
  TextEditingController oldpassEditingController = TextEditingController();
  TextEditingController confirmpassEditingController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool _checkCurrentPasswordValid = true;
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
      padding: EdgeInsets.fromLTRB(w / 15, w / 80, w / 15, h / 40),
      child: TextFormField(
        obscureText: _isHidden,
        controller: oldpassEditingController,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _isHidden ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isHidden = !_isHidden; //show or hide password
                });
              },
            ),
            contentPadding: EdgeInsets.fromLTRB(w / 20, w / 30, w / 20, w / 30),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            errorText: _checkCurrentPasswordValid
                ? null
                : "Please check your current password"),
        onSaved: (String? value) {},
      ),
    );
    final newpass = Padding(
      padding: EdgeInsets.fromLTRB(w / 15, w / 80, w / 15, h / 40),
      child: TextFormField(
        obscureText: _isHidden,
        controller: newpassEditingController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isHidden = !_isHidden; //show or hide password
              });
            },
          ),
          contentPadding: EdgeInsets.fromLTRB(w / 20, w / 30, w / 20, w / 30),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onSaved: (String? value) {},
        validator: (String? value) {
          print("Length of Password is : ");
          print(value!.length);
          return (value.length <= 6)
              ? 'Password should be more than 6 characters'
              : null;
        },
      ),
    );
    final confirmpass = Padding(
      padding: EdgeInsets.fromLTRB(w / 15, w / 80, w / 15, h / 40),
      child: TextFormField(
          obscureText: _isHidden,
          controller: confirmpassEditingController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _isHidden ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isHidden = !_isHidden; //show or hide password
                });
              },
            ),
            contentPadding: EdgeInsets.fromLTRB(w / 20, w / 30, w / 20, w / 30),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          textInputAction: TextInputAction.next,
          validator: (value) {
            return (newpassEditingController.text != value)
                ? 'Please check your new Password'
                : null;
          }),
    );

    final saveButton = Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF7FB77E),
      child: MaterialButton(
          onPressed: () async {
            _checkCurrentPasswordValid = await checkCurrentPassword(
                oldpassEditingController.text, newpassEditingController.text);
            setState(() {});
            if (_formKey.currentState!.validate() &&
                _checkCurrentPasswordValid) {
              updateUserPassword(newpassEditingController.text);
              Fluttertoast.showToast(msg: "Password Updated successfully!\nLogin with the new Password to continue");
               Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false);
            }
          },
          child: Text(
            "Save",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
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
                fontWeight: FontWeight.w700)),
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            SizedBox(height: h / 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(h / 30, 0, 0, 0),
                  child: Text(
                    'Old Password',
                    style:
                        GoogleFonts.lato(fontSize: h / 42, color: Colors.black),
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
                    style:
                        GoogleFonts.lato(fontSize: h / 42, color: Colors.black),
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
                    style:
                        GoogleFonts.lato(fontSize: h / 42, color: Colors.black),
                  ),
                ),
              ],
            ),
            confirmpass,
            SizedBox(height: h / 40),
            saveButton
          ]),
        ),
      ),
    );
  }

  void updateUserPassword(String newpassword) async {
    try {
      final _firebaseUser = await FirebaseAuth.instance.currentUser;
      _firebaseUser!.updatePassword(newpassword);
    } catch (e) {
      print(e);
    }
  }
}

Future<bool> checkCurrentPassword(
    String oldpassword, String newpassword) async {
  final _firebaseUser = FirebaseAuth.instance.currentUser;
  final _firebaseUserEmail = _firebaseUser!.email;

  var _authCredentials = EmailAuthProvider.credential(
      email: _firebaseUserEmail!, password: oldpassword);

  try {
    var authResult =
        await _firebaseUser.reauthenticateWithCredential(_authCredentials);
    _firebaseUser.updatePassword(newpassword);
    return authResult.user != null;
  } catch (e) {
    print(e);
  }
  return false;
}
