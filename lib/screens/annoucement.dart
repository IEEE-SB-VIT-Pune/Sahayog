import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnnoucementsPage extends StatelessWidget {
  @override
  DatePick(context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2030),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
              primary: Color.fromARGB(255, 136, 76, 214),
              onPrimary: Colors.white,
              onSurface: Color.fromARGB(255, 0, 0, 0),
            )),
            child: child!,
          );
        });
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Annoucements'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 136, 76, 214),
          actions: <Widget>[
            Container(
              child: IconButton(
                onPressed: () {
                  DatePick(context);
                },
                icon: FaIcon(FontAwesomeIcons.calendarDays),
              ),
            ),
          ],
        ),
      );
}
