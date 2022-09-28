import 'package:flutter/material.dart';
class ConfirmPasswordField extends StatefulWidget {
  const ConfirmPasswordField({super.key});

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
    final TextEditingController confirmPasswordController = new TextEditingController();
    bool _isObscure=true;
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
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
        confirmPasswordController.text = valve!;
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
        labelText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}