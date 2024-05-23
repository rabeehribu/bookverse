import 'package:bookverse/Controller/user_controller.dart';
import 'package:bookverse/Views/users/forgotpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/admin_controller.dart';

class AdminSignIn extends StatelessWidget {
  AdminSignIn({Key? key}) : super(key: key);
  TextEditingController mailIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AdminController>(context, listen: false);

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
                                "SIGN IN",
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
                              Card(
                                  elevation: 4,
                                  child: TextField(controller: mailIDController,
                                    decoration: const InputDecoration(
                                        hintText: "email",
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
                              Card(
                                  elevation: 4,
                                  child: TextField(controller: passwordController,
                                    decoration: const InputDecoration(
                                        hintText: "Password",
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
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Align(alignment: Alignment.centerRight,
                                  child: InkWell(onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword(),));
                                  },
                                    child: Text("Forgot password?", style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: GoogleFonts.lora().fontFamily,fontSize: 14,
                                    ),),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {authProvider.adminLogin(mailIDController.text, passwordController.text, context);},
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
                                      "SIGN UP",
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
