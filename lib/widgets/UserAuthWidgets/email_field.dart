import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

TextEditingController emailController = new TextEditingController();

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (valve) {
        var val = valve;
        RegExp regex = new RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
        if (val!.isEmpty) {
          return ("Email Required");
        }
        //reg expression for email validation
        if (!regex.hasMatch(val)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (valve) {
        emailController.text = valve!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
