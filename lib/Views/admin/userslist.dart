import 'package:bookverse/Views/admin/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class UsersList extends StatelessWidget {
  UsersList({super.key});

  @override
  List<Map<String, dynamic>> userList = [
    {'name': 'Muhammed', 'phone': '9961667273'},
    {'name': 'jasil', 'phone': '9961667273'},
    {'name': 'shameem', 'phone': '9961667273'},
    {'name': 'hakkeem', 'phone': '9961667273'},
    {'name': 'farshid', 'phone': '9961667273'},
    {'name': 'Muhammed', 'phone': '9961667273'},
    {'name': 'Muhammed', 'phone': '9961667273'},
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
            padding: const EdgeInsets.only(top: 180),
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetails(name: userList[index]['name'], phone: userList[index]['phone'],),));
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
                                  Text(userList[index]['name']),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Text("   Phone     : ",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold)),
                                  Text(userList[index]['phone']),
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
