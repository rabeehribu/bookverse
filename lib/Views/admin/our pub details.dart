import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class OurPubDetails extends StatelessWidget {
  OurPubDetails({super.key, required this.name, required this.phone});

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
                "Publications",
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
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 170),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 460,
                      width: 310,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('F8AFAF').withOpacity(0.12),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "PUBLICATIONS REQUEST",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: HexColor("000000"),
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Card(elevation: 4,child: Container(height: 100,width: 100,decoration: const BoxDecoration(color: Colors.white),child: Center(child: Image.asset("assets/Vector (6).png"),),)),
                                const SizedBox(width: 35,),

                                Card(elevation: 4,child: Container(height: 100,width: 100,decoration: const BoxDecoration(color: Colors.white),child: Center(child: Image.asset("assets/Vector (6).png"),),)),
                              ],
                            ),
                            buildContainer("Book name"),
                            buildContainer("Name"),
                            buildContainer("Email"),
                            buildContainer("Contact"),
                            buildContainer("place"),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Card(elevation: 4,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 38,
                                  width: 126,
                                  decoration: BoxDecoration(
                                    color: HexColor("C0A0A0"),
                                  ),
                                  child: const Text(
                                    "DELETE",
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
