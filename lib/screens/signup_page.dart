import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/screens/login_page.dart';
import '../widgets/login_signup_widgets/confirm_password_field.dart';
import '../widgets/login_signup_widgets/email_field.dart';
import '../widgets/login_signup_widgets/name_field.dart';
import '../widgets/login_signup_widgets/password_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  bool _isObscure1 = true, _isObscure2 = true;
  var h, s, w;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailSignupController =
      new TextEditingController();
  final TextEditingController passwordSignupController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailSignupController = new TextEditingController();
    TextEditingController passwordSignupController =
        new TextEditingController();

    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    var _val;
    var regex = new RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
    final emailSignupField = TextFormField(
      autofocus: false,
      controller: emailSignupController,
      keyboardType: TextInputType.emailAddress,
      validator: (valve) {
        _val = valve;
        if (_val!.isEmpty) {
          return ("Email Required");
        }
        if (!regex.hasMatch(_val)) {
          return ("Please Enter a valid Email");
        }
        return null;
      },
      onSaved: (valve) {
        emailController.text = valve!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(
            20 * w / 360, 15 * h / 640, 20 * w / 360, 15 * h / 640),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20 * w / 360),
        ),
      ),
    );
    final passwordSignupField = TextFormField(
      autofocus: false,
      controller: passwordSignupController,
      obscureText: _isObscure1,
      validator: (valve) {
        RegExp regex = new RegExp(r'^.{4,}$');

        //storing the password to check with confirm password
        _val = valve;

        if (valve!.isEmpty) {
          return ('Password Required');
        }
        if (!regex.hasMatch(valve)) {
          return ('Enter Valid Password(Min. 6 Characters)');
        }
      },
      onSaved: (valve) {
        passwordController.text = valve!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_sharp),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure1 ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isObscure1 = !_isObscure1;
            });
          },
        ),
        contentPadding: EdgeInsets.fromLTRB(15 * w / 360, 20, 15 * w / 360, 20),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20 * w / 360),
        ),
      ),
    );

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
                "Create Account",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 22 * w / 360,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 30 * w / 360,
              ),
              Text(
                "Come on board with the others!",
                style: GoogleFonts.monda(
                    color: Color(0Xff959595), fontSize: 12 * w / 360),
              ),
            ],
          ),
          SizedBox(
            height: 15 * h / 640,
          ),
          Container(
            height: 167 * h / 640,
            width: 287 * w / 360,
            child: SvgPicture.asset(
              'assets/signup_page.svg',
            ),
          ),
          SizedBox(
            height: 15 * h / 640,
          ),
          Text(
            "Sign Up",
            style: GoogleFonts.montserrat(
                fontSize: 25 * w / 360, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15 * h / 640,
          ),
          SizedBox(width: w / 1.36, height: 38 * h / 640, child: NameField()),
          SizedBox(
            height: 9 * h / 640,
          ),
          SizedBox(
              width: w / 1.36, height: 38 * h / 640, child: emailSignupField),
          SizedBox(
            height: 9 * h / 640,
          ),
          SizedBox(
              width: w / 1.36,
              height: 38 * h / 640,
              child: passwordSignupField),
          SizedBox(
            height: 9 * h / 640,
          ),
          SizedBox(
              width: w / 1.36,
              height: 38 * h / 640,
              child: ConfirmPasswordField()),
          SizedBox(
            height: 9 * h / 640,
          ),
          InkWell(
            onTap: (() {
              signUp(emailSignupController.text.trim(),
                  passwordSignupController.text.trim());
            }),
            child: Container(
              height: 33 * h / 640,
              width: w * 185 / 360,
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30 * w / 360),
                color: Color(0Xff3780CB),
              ),
            ),
          ),
          SizedBox(
            height: 5 * h / 640,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Or Sign Up with",
                style: GoogleFonts.monda(
                    fontSize: 12 * w / 360, color: Color(0Xff959595)),
              ),
            ],
          ),
          SizedBox(
            height: 7 * h / 640,
          ),
          Container(
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
                borderRadius: BorderRadius.circular(8 * w / 360)),
          ),
          SizedBox(
            height: 13 * h / 640,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: GoogleFonts.openSans(color: Colors.black),
              ),
              InkWell(
                child: Text("Login",
                    style: GoogleFonts.openSans(
                        color: Color(0Xff3780CB), fontWeight: FontWeight.bold)),
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => LoginPage()))),
              )
            ],
          ),
        ],
      ),
    ));
  }

  Future signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailSignupController.text,
        password: passwordSignupController.text,
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }
}
      // await _auth
      //     .createUserWithEmailAndPassword(
      //         email: emailSignupController.text.trim(),
      //         password: passwordSignupController.text.trim())
      //     .then((value) => {
      //           postDetailsToFirestore(),
      //         })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }

  // void postDetailsToFirestore() async {
  //   //calling firestore
  //   //calling usermodel
  //   //sending these valves

  //   // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   // User? user = _auth.currentUser;

  //   // UserModel usm = UserModel();

  //   // usm.email = user!.email;
  //   // usm.uid = user.uid;
  //   // usm.firstName = nameController.text;

  //   // await firebaseFirestore.collection("Users").doc(usm.uid!).set(usm.toMap());
  //   // Fluttertoast.showToast(msg: "Account created successfully :) ");

  //   Navigator.pushAndRemoveUntil((context),
  //       MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  // 
