import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class UserDetails extends StatelessWidget {
  UserDetails({super.key, required this.name, required this.phone});

  var name, phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 200),
            painter: HeaderCurvedContainer(),
          ),
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
,
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 190),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 354,
                width: 300,
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
                        "USER DETAILS",
                        style: TextStyle(
                            fontSize: 15,
                            color: HexColor("000000"),
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildContainer("name"),
                      buildContainer("age"),
                      buildContainer("gender"),
                      buildContainer("Contact"),
                      buildContainer("email"),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Card(elevation: 2,
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 266,
                            decoration: BoxDecoration(
                              color: HexColor("C0A0A0"),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              "DELETE USER",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
      child: Card(elevation: 2,
        child: Container(width: 270,height: 45,alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              hintText,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: HexColor("000000").withOpacity(0.38)
              ),
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
