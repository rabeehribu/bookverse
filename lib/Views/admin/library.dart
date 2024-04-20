import 'package:bookverse/Views/admin/userslist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'REQUESTS.dart';
import 'ourlibrarys.dart';

class AdminLibrarys extends StatelessWidget {
  const AdminLibrarys({Key? key});

  @override
  Widget build(BuildContext context) {
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
                        widthFactor: 0.7, // Adjust this factor to control the width of the text relative to the screen width
                        alignment: Alignment.center,
                        child: Text(
                          "Library",
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
              padding: const EdgeInsets.only(top: 208.0),
              child: SizedBox(
                height: 230,
                width: 290,
                child: Column(
                  children: [
                    buildMenuItem(
                      context,
                      "REQUESTS",
                      onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => RequestsLibrary(),));                      },
                    ),
                    buildMenuItem(
                      context,
                      "OUR LIBRARIES",
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  OurLibrary()     ));                    },
                    ),

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
