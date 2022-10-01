import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Map<String, Icon> pairMap = {
  'Gender': Icon(Icons.transgender_sharp, color: Colors.blue.shade900),
  'Male': Icon(Icons.male_sharp, color: Colors.blue.shade900),
  'Female': Icon(Icons.female_sharp, color: Colors.blue.shade900),
  'Other': Icon(Icons.transgender_sharp, color: Colors.blue.shade900),
};

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

DateTime date = DateTime.now();
String finalDate = date.toString();

class _ProfilePageState extends State<ProfilePage> {
  List<String> menuItems = ['Gender', 'Male', 'Female', 'Other'];
  String? selectedValue = 'Gender';

  @override
  Widget build(BuildContext context) {
    var h, w;
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: w / 15,
              fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: h / 10, top: h / 5),
          ),
          SingleChildScrollView(
            child: Container(
                padding:
                    EdgeInsets.only(left: w / 15, right: w / 8, top: h / 3),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: h / 20,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person,
                                    color: Colors.blue.shade900),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Name",
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.blue.shade800),
                                    borderRadius: BorderRadius.circular(5))),
                          )),
                      SizedBox(height: h / 40),
                      SizedBox(
                        height: h / 20,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.blue.shade900,
                            ),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Email",
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      SizedBox(height: h / 40),
                      SizedBox(
                          height: h / 20,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                icon: Icon(Icons.phone,
                                    color: Colors.blue.shade900),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Phone",
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                focusColor: Colors.blue.shade900),
                          )),
                      SizedBox(height: h / 40),
                      SizedBox(
                        height: h / 22,
                        width: w / 2,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_month,
                                  color: Colors.blue.shade900),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Enter Date Of Birth",
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusColor: Colors.blue.shade900),
                        ),
                      ),
                      SizedBox(height: h / 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: h / 20,
                              child: pairMap[selectedValue.toString()]),
                          Padding(padding: EdgeInsets.only(left: w / 24)),
                          SizedBox(
                              height: h / 22,
                              width: w / 2.5,
                              child: DropdownButtonFormField(
                                  value: selectedValue,
                                  onChanged: (item) =>
                                      setState(() => selectedValue = item),
                                  items: menuItems
                                      .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(item,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      Colors.grey.shade700))))
                                      .toList(),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ))),
                        ],
                      ),
                      SizedBox(height: h / 20),
                      SizedBox(
                          height: h / 20,
                          width: h / 0.5,
                          child: Center(
                              child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple.shade500,
                                minimumSize: const Size.fromWidth(200),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: (() {}),
                            child: Text("Save"),
                          ))),
                      SizedBox(height: h / 20),
                    ])),
          )
        ],
      ),
    );
  }
}
