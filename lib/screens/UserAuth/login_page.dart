import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/screens/UserAuth/signup_page.dart';
import 'package:ieee_app_project/widgets/bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../widgets/UserAuthWidgets/email_field.dart';
import '../../widgets/UserAuthWidgets/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var h, s, w;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30 * h / 640,
          ),
          Row(
            children: [
              SizedBox(
                width: 30 * w / 360,
              ),
              Text(
                "Welcome Back👋🏽",
                style: GoogleFonts.poppins(fontSize: 22 * w / 360),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 30 * w / 360,
              ),
              Text(
                "Hello again. You've been missed!",
                style: GoogleFonts.monda(
                    color: Color(0Xff959595), fontSize: 12 * w / 360),
              ),
            ],
          ),
          Container(
            height: 167 * h / 640,
            width: 287 * w / 360,
            child: SvgPicture.asset(
              'assets/login_page.svg',
            ),
          ),
          SizedBox(
            height: 15 * h / 640,
          ),
          Text(
            "Login",
            style: GoogleFonts.montserrat(
                fontSize: 25 * w / 360, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 17 * h / 640,
          ),
          SizedBox(width: w / 1.36, height: 38 * h / 640, child: EmailField()),
          SizedBox(
            height: 22 * h / 640,
          ),
          SizedBox(
              width: w / 1.36, height: 38 * h / 640, child: PasswordField()),
          SizedBox(
            height: 27 * h / 640,
          ),
          InkWell(
            onTap: () async {
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setString('email', emailController.text);

              signIn(emailController.text, passwordController.text);
            },
            child: Container(
              height: 33 * h / 640,
              width: w * 185 / 360,
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0Xff3780CB),
              ),
            ),
          ),
          SizedBox(
            height: 17 * h / 640,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                ],
              ),
              Text("Or continue with",
                  style: GoogleFonts.monda(
                    fontSize: 12 * w / 360,
                    color: Color(0Xff959595),
                  ))
            ],
          ),
          SizedBox(
            height: 17 * h / 640,
          ),
          GestureDetector(
            onTap: () async {
              await signInWithGoogle();
            },
            child: Container(
              height: 33 * h / 640,
              width: w * 185 / 360,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/google_icon.svg'),
                  // FaIcon(FontAwesomeIcons.google),
                  SizedBox(
                    width: 8 * w / 360,
                  ),
                  Text(
                    "Google",
                    style: GoogleFonts.poppins(
                        fontSize: 15 * w / 360, color: Color(0Xff000000)),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          SizedBox(
            height: 22 * h / 640,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New Here? ",
                style: GoogleFonts.openSans(color: Colors.black),
              ),
              InkWell(
                child: Text("Signup Now",
                    style: GoogleFonts.openSans(
                        color: Color(0Xff3780CB), fontWeight: FontWeight.bold)),
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => SignUpPage()))),
              )
            ],
          ),
        ],
      ),
    ));
  }

  Future signIn(String email, String password) async {
    // showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator(),) );
    if (emailController.text.trim() != null &&
        passwordController.text.trim() != null) {
      await _auth
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          )
          .then((uid) => {
                Fluttertoast.showToast(msg: 'Login Successfully'),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BottomNavBar()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
      // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
    }
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
