import 'package:bookverse/Views/users/forgotpassword.dart';
import 'package:bookverse/Views/users/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'bottomnavbar.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

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
            padding: const EdgeInsets.only(top: 170),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 55),
                    child: Container(
                      height: 290,
                      width: 370,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('F8AFAF').withOpacity(0.12),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                "NEW PASSWORD",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.lora().fontFamily,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.02,
                              ),
                              const Card(
                                  elevation: 4,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Enter new Password",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                        filled: true,
                                        isDense: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  )),
                              const Card(
                                  elevation: 4,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Confirm Password",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                        filled: true,
                                        isDense: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  )),


                              const SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavBar(),));},
                                child: Card(
                                  elevation: 8,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 38,
                                    width: 106,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(2, 2),
                                            blurRadius: 3,
                                            color: Colors.grey)
                                      ],
                                      color: HexColor("C0A0A0"),
                                    ),
                                    child: const Text(
                                      "SUBMIT",
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
                  ),
                ],
              ),
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
