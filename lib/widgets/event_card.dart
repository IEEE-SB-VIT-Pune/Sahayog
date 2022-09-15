import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget eventCard(Function()? onTap, querryDocumentSnapshot) {
  return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ], color: Color(0XffF9F6DF), borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Color(0XffFAF4B7),
              ),
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text('Housefull Evening',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    bottom: 8,
                    top: 8,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Color(0Xff7950F2),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          '4:00 PM',
                          style: GoogleFonts.lato(
                              fontSize: 14, color: Color(0Xff7950F2)),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    bottom: 8,
                    top: 8,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_sharp, color: Color(0Xff7950F2)),
                      Text(
                        'Common Area',
                        style: GoogleFonts.lato(
                            fontSize: 14, color: Color(0Xff7950F2)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'About the event:',
                style: GoogleFonts.openSans(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 8),
              child: Text(
                'Get together with your buddies and enjoy your time with a little competitive spirit. ',
                style: GoogleFonts.openSans(
                    fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0Xff7FB77E),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "Attend",
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0XffFFFFFF)),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 15),
                  child: Text(
                    "Sunita and 22 more are \nattending",
                    style: GoogleFonts.monda(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color(0Xff706666)),
                  ),
                )
              ],
            ),
          ],
        ),
      ));
}
