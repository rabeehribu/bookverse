import 'package:bookverse/Views/admin/adminHomepage.dart';
import 'package:bookverse/Views/users/signin.dart';
import 'package:bookverse/Views/users/signup.dart';
import 'package:bookverse/Views/users/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Continue_As extends StatelessWidget {
  const Continue_As({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 200),
            painter: HeaderCurvedContainer(),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding:  EdgeInsets.only(top: 175),
            child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      height: 460,
                      width: 370,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('F8AFAF').withOpacity(0.12),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "BookVerse",
                              style: TextStyle(
                                color: HexColor("DEDADA"),
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.lora().fontFamily,
                                shadows: const [
                                  Shadow(
                                      color: Colors.black, offset: Offset(2, 2))
                                ],
                                fontSize: MediaQuery.of(context).size.width *
                                    0.08, // Adjust this factor to control the font size relative to the screen width
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.20,
                            ),
                            Text(
                              "You Are?",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.lora().fontFamily,
                                fontSize:
                                MediaQuery.of(context).size.width * 0.05,
                                shadows: const [
                                  Shadow(
                                      color: Colors.black,
                                      offset: Offset(2, 2),
                                      blurRadius: 3)
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            InkWell(
                              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHome(),));},
                              child: Card(elevation: 8,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 38,
                                  width: 106,
                                  decoration: BoxDecoration(boxShadow: const [BoxShadow(offset: Offset(2, 2),blurRadius: 3,color: Colors.grey)],
                                    color: HexColor("C0A0A0"),
                                  ),
                                  child: const Text(
                                    "Admin",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            InkWell(
                              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomePage(),));},
                              child: Card(elevation: 8,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 38,
                                  width: 106,
                                  decoration: BoxDecoration(boxShadow: const [BoxShadow(offset: Offset(2, 2),blurRadius: 3,color: Colors.grey)],
                                    color: HexColor("C0A0A0"),
                                  ),
                                  child: const Text(
                                    "User",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainer(String hintText) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Card(
        elevation: 2,
        child: Container(
          width: 270,
          height: 45,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              hintText,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: HexColor("000000").withOpacity(0.38)),
            ),
          ),
        ),
      ),
    );
  }
}

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
