import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_app_project/screens/home_page.dart';
import 'package:ieee_app_project/screens/login_page.dart';
import 'package:ieee_app_project/widgets/bottom_nav_bar.dart';
import '../models/user_model.dart';


TextEditingController passwordSignupController = TextEditingController();
TextEditingController emailSignupController = TextEditingController();
TextEditingController nameController =  TextEditingController();
  final _auth = FirebaseAuth.instance;

class NameField extends StatefulWidget {
   NameField({super.key});
     

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      validator: (valve) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (valve!.isEmpty) {
          return ('First Name Required');
        }
        if (!regex.hasMatch(valve)) {
          return ('Enter Valid FirstName(Min. 3 Characters)');
        }
        return null;
      },
      onSaved: (valve) {
        nameController.text = valve!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(15, 15, 25, 15),
        labelText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
class PasswordSignUpField extends StatefulWidget {
  const PasswordSignUpField({super.key});

  @override
  State<PasswordSignUpField> createState() => _PasswordSignUpFieldState();
}

class _PasswordSignUpFieldState extends State<PasswordSignUpField> {
  @override
  Widget build(BuildContext context) {
    
    bool _isObscure1 = true, _isObscure2 = true;
    var h, s, w;
    var _val;
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    return TextFormField(
      autofocus: false,
      controller: passwordSignupController,
      obscureText: _isObscure1,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{4,}$');

        //storing the password to check with confirm password
        _val = value;

        if (value!.isEmpty) {
          return ('Password Required');
        }
        if (!regex.hasMatch(value)) {
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
  }
}

class EmailSignUpField extends StatefulWidget {
  const EmailSignUpField({super.key});

  @override
  State<EmailSignUpField> createState() => _EmailSignUpFieldState();
}

class _EmailSignUpFieldState extends State<EmailSignUpField> {
  @override
  Widget build(BuildContext context) {
    var h, s, w;
    var _val;
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;

    return TextFormField(
      autofocus: false,
      controller: emailSignupController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        _val = value;
        if (_val!.isEmpty) {
          return ("Email Required");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
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
  }
}

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
  @override
  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    var _val;

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
              width: w / 1.36, height: 38 * h / 640, child: EmailSignUpField()),
          SizedBox(
            height: 9 * h / 640,
          ),
          SizedBox(
              width: w / 1.36,
              height: 38 * h / 640,
              child: PasswordSignUpField()),
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
void postDetailsToFirestore() async {
    //calling firestore
    //calling usermodel
    //sending these valves
    UserModel usm = UserModel();

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    usm.email = user!.email;
    usm.uid = user.uid;
    usm.name= nameController.text;

    await firebaseFirestore.collection("users").doc(usm.uid!).set(usm.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => BottomNavBar(1)),
        (route) => false);
  }
  Future signUp(String email, String password) async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailSignupController.text,
        password: passwordSignupController.text,
      ).then((value) => {postDetailsToFirestore()}).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
  }
}
