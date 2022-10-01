import 'package:flutter/material.dart';
class PasswordField extends StatefulWidget {
PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
  
}
TextEditingController passwordController = new TextEditingController();

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;
  // String LabelText;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: _isObscure,
      validator: (valve) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (valve!.isEmpty) {
          return ('Password Required');
        }
        if (!regex.hasMatch(valve)) {
          return ('Enter Valid Password(Min. 6 Characters)');
        }
        return null;
      },
      onSaved: (valve) {
        passwordController.text = valve!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_sharp),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        // contentPadding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        labelText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}