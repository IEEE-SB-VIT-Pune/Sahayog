import 'package:flutter/material.dart';
class NameField extends StatefulWidget {
  const NameField({super.key});

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
    final TextEditingController nameController = new TextEditingController();

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