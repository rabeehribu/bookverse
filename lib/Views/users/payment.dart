import 'package:bookverse/Views/users/home.dart';
import 'package:bookverse/Views/users/successfull_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/Providers/provider.dart';
import 'bottomnavbar.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProviders>(context);

    return SafeArea(
      child: Scaffold(
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
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .70,
                        width: 370,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: HexColor('F8AFAF').withOpacity(0.12),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(
                                  "PAYMENT DETAILS",
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
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Text(
                                        "Net Banking",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                        textAlign: TextAlign.center,
                                      ),
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/networking.png"),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            provider.tickIcon1();
                                          },
                                          icon:provider.tick? Icon(Icons.check_circle_outline,color: Colors.black,):Icon(Icons.check_circle_outline,color: Colors.green,)
                                      ),
                                    )),
                                Card(
                                    elevation: 4,
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Text(
                                        "Gpay",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                        textAlign: TextAlign.center,
                                      ),
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/google-pay-icon-20205841.logowik 1.png"),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            provider.tickIcon2();
                                          },
                                          icon:provider.tick2? Icon(Icons.check_circle_outline,color: Colors.black,):Icon(Icons.check_circle_outline,color: Colors.green,)
                                      ),
                                    )),
                                Card(
                                    elevation: 4,
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Text(
                                        "Phonepay",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                        textAlign: TextAlign.center,
                                      ),
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/Phonepay.png"),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            provider.tickIcon3();
                                          },
                                          icon:provider.tick3? Icon(Icons.check_circle_outline,color: Colors.black,):Icon(Icons.check_circle_outline,color: Colors.green,)
                                      ),
                                    )),
                                Card(
                                    elevation: 4,
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Text(
                                        "Debit/Credit card",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                        textAlign: TextAlign.center,
                                      ),
                                      leading: Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  .15,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                "assets/dabit-card2 1 (1).png"),
                                          ))),
                                      trailing: IconButton(
                                          onPressed: () {
                                            provider.tickIcon4();
                                          },
                                          icon:provider.tick4? Icon(Icons.check_circle_outline,color: Colors.black,):Icon(Icons.check_circle_outline,color: Colors.green,)
                                      ),
                                    )),
                                Card(
                                    elevation: 4,
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Text(
                                        "Paytm",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                        textAlign: TextAlign.center,
                                      ),
                                      leading: Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  .15,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Paytm_Logo_(standalone) 1.png"),
                                          ))),
                                      trailing: IconButton(
                                          onPressed: () {
                                            provider.tickIcon5();
                                          },
                                          icon:provider.tick5? Icon(Icons.check_circle_outline,color: Colors.black,):Icon(Icons.check_circle_outline,color: Colors.green,)
                                      ),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Successfully(),
                                        ));
                                  },
                                  child: Card(
                                    elevation: 8,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 38,
                                      width:
                                          MediaQuery.of(context).size.width * .50,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(2, 3),
                                              blurRadius: 3,
                                              color: Colors.grey)
                                        ],
                                        color: HexColor("C0A0A0"),
                                      ),
                                      child: const Text(
                                        "CONFIRM ORDER ",
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
              ),
            ),
          ],
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
