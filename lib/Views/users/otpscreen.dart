import 'package:bookverse/Views/users/changetonewpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override

  Widget build(BuildContext context) {
var pinController = TextEditingController();
// final defaultPinTheme = PinTheme(
//   width: 56,
//   height: 56,
//   textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
//   decoration: BoxDecoration(color: Colors.white,
//     border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
//     borderRadius: BorderRadius.circular(10),
//   ),
// );

// final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//   border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
//   borderRadius: BorderRadius.circular(8),
// );
//
// final submittedPinTheme = defaultPinTheme.copyWith(
//   decoration: defaultPinTheme.decoration?.copyWith(
//     color: Color.fromRGBO(234, 239, 243, 1),
//   ),
// );

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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 55),
                    child: Container(
                      height: 250,
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
                              const SizedBox(height: 15,),
                              Text(
                                "ENTER OTP HERE",
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

                              const SizedBox(
                                height: 10,
                              ),
    // Pinput(
    // defaultPinTheme: defaultPinTheme,
    // focusedPinTheme: focusedPinTheme,
    // submittedPinTheme: submittedPinTheme,
    // validator: (s) {
    // return s == '2222' ? null : 'Pin is incorrect';
    // },
    // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
    // showCursor: true,
    // onCompleted: (pin) => print(pin),
    // ),
    //
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPassword(),));},
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
