import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Successfully extends StatelessWidget {
  const Successfully({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("C0A0A0"),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/its succes full.png"),
              Text(
                "Congratulations!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontFamily: GoogleFonts.sofadiOne().fontFamily,
                ),
              ),
              Text(
                "Order placed successfully",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontFamily: GoogleFonts.sofadiOne().fontFamily,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * .050,
                width: MediaQuery.of(context).size.width * .25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(
                      fontFamily: GoogleFonts.sofadiOne().fontFamily,
                      color: Colors.white,
                      fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
