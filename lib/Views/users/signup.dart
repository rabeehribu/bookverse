import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/user_bakend_servieces.dart';
import '../admin/Publications.dart';
import 'bottomnavbar.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController mailIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 200),
                      painter: HeaderCurvedContainer(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 170.0),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 470,
                            width: 370,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                              color: HexColor('F8AFAF').withOpacity(0.12),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                                    child: Text(
                                      "CREATE ACCOUNT",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: GoogleFonts.lora().fontFamily,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                  Card(
                                    child: TextField(
                                      controller: fullNameController,
                                      decoration: const InputDecoration(
                                          hintText: "Full Name",
                                          filled: true,
                                          isDense: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                  Card(
                                    child: TextField(
                                      controller: ageController,
                                      decoration: const InputDecoration(
                                          hintText: "Age",
                                          filled: true,
                                          isDense: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                  Card(
                                    child: TextField(
                                      controller: genderController,
                                      decoration: const InputDecoration(
                                          hintText: "Gender",
                                          filled: true,
                                          isDense: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                  Card(
                                    child: TextField(
                                      controller: phoneNumberController,
                                      decoration: const InputDecoration(
                                          hintText: "Phone Number",
                                          filled: true,
                                          isDense: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                  Card(
                                    child: TextField(
                                      controller: mailIDController,
                                      decoration: const InputDecoration(
                                          hintText: "Mail ID",
                                          filled: true,
                                          isDense: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                  Card(
                                    child: TextField(
                                      controller: passwordController,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                          hintText: "Password",
                                          filled: true,
                                          isDense: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),

                                  InkWell(
                                    onTap: ()  {
                                      authProvider.signUp(
                                        fullNameController.text,
                                        ageController.text,
                                        genderController.text,
                                        phoneNumberController.text,
                                        mailIDController.text,
                                        passwordController.text,
                                        context,
                                      ); // <- Add a semicolon here

                                    },
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
                                          "SIGN IN",
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
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
