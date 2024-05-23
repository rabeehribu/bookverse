import 'package:bookverse/Views/library/view_books.dart';
import 'package:bookverse/Views/publications/pub_viewbooks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/user_controller.dart';
import '../library/add_books.dart';
import 'add_pub_books.dart';



class Publications_Home extends StatelessWidget {
  const Publications_Home({Key? key});

  @override
  Widget build(BuildContext context) {
    final authProvider =
    Provider.of<UserAuthenticationProvider>(context, listen: false);
    return SafeArea(

      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: HeaderCurvedContainer(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(
                      top: 65,
                      left: 0,
                      right: 0,
                      child: FractionallySizedBox(
                        widthFactor: 0.6, // Adjust this factor to control the width of the text relative to the screen width
                        alignment: Alignment.center,
                        child: Text(
                          "BookVerse",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.lora().fontFamily,
                            shadows: const [Shadow(color: Colors.black, offset: Offset(2, 2))],
                            fontSize: MediaQuery.of(context).size.width * 0.06, // Adjust this factor to control the font size relative to the screen width
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 98.0),
              child: SizedBox(
                height: 230,
                width: 290,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    buildMenuItem(
                      context,
                      "VIEW BOOKS ",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>   PubViewBooks()));
                      },
                    ),

                    buildMenuItem(
                      context,
                      "LOG OUT",
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: HexColor('C0A0A0'),
                              title: const Text(
                                "Are you sure,\nYou want to Logout?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                              actions:  [
                                InkWell(onTap: () {
                                  Navigator.pop(context);
                                },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                InkWell(onTap: () {
                                  authProvider.signOut(context);
                                },
                                  child: const Text(
                                    "LOGOUT",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                              offset: Offset(3, 3),
                                              color: Colors.black)
                                        ]),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String text,
      {VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: HexColor("C0A0A0"),
          ),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.lora().fontFamily,
                shadows: const [Shadow(color: Colors.black, offset: Offset(2, 2))],
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// CustomPainter class to for the header curved-container
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = HexColor("C0A0A0");
    Path path = Path()
      ..relativeLineTo(0, 120)
      ..quadraticBezierTo(size.width / 2, 200.0, size.width, 120)
      ..relativeLineTo(0, -120)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
