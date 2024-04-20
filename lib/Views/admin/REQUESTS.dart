import 'package:bookverse/Views/admin/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'lib accept or reject.dart';

class RequestsLibrary extends StatelessWidget {
  RequestsLibrary({super.key});

  @override
  List<Map<String, dynamic>> librarys = [
    {'name': 'FIORA BOOKS', 'Location': 'Calicut'},
    {'name': 'FIORA BOOKS', 'Location': 'Palakkad'},
    {'name': 'FIORA BOOKS', 'Location': 'Malappuram'},
    {'name': 'FIORA BOOKS', 'Location': 'Kollam'},
    {'name': 'FIORA BOOKS', 'Location': 'Kozikod'},
    {'name': 'FIORA BOOKS', 'Location': 'Kochi'},
    {'name': 'FIORA BOOKS', 'Location': 'Kannur'},
  ];
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
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 180),
            child: ListView.builder(
              itemCount: librarys.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LibraryAcceptorNot(name: librarys[index]['name'], phone: librarys[index]['phone'],),));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor("F8AFAF").withOpacity(0.12),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          padding: const EdgeInsets.all(10),
                          width: 290,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text("   Name      : ",
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                                  Text(librarys[index]['name']),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Text("   Phone     : ",
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                                  Text(librarys[index]['Location']),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
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
