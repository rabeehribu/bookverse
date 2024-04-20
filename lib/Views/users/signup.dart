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
    final authProvider = Provider.of<AuthenticationProvider>(context, listen: false);

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
                        child: Container(
                          height: 470,
                          width: 370,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor('F8AFAF').withOpacity(0.12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "CREATE ACCOUNT",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.lora().fontFamily,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: fullNameController,
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                ),
                              ),
                              TextField(
                                controller: ageController,
                                decoration: InputDecoration(
                                  hintText: "Age",
                                ),
                              ),
                              TextField(
                                controller: genderController,
                                decoration: InputDecoration(
                                  hintText: "Gender",
                                ),
                              ),
                              TextField(
                                controller: phoneNumberController,
                                decoration: InputDecoration(
                                  hintText: "Phone Number",
                                ),
                              ),
                              TextField(
                                controller: mailIDController,
                                decoration: InputDecoration(
                                  hintText: "Mail ID",
                                ),
                              ),
                              TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  bool signUpSuccess = await authProvider.signUp(
                                    fullNameController.text,
                                    ageController.text,
                                    genderController.text,
                                    phoneNumberController.text,
                                    mailIDController.text,
                                    passwordController.text,
                                    context,
                                  ); // <- Add a semicolon here
                                  if (signUpSuccess) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BottomNavBar(),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Sign up failed. Please try again.'),
                                      ),
                                    );
                                  }
                                },
                                child: Text("SIGN UP"),
                              ),

                            ],
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
