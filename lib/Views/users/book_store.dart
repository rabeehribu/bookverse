import 'package:bookverse/Views/users/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/Providers/provider.dart';
import '../../widget_model/drwer.dart';

class Bookstore extends StatelessWidget {
  const Bookstore({Key? key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProviders>(context);

    List<Map<String, dynamic>> recommended = [
      {'image': 'assets/agatha2.jpg'},
      {'image': 'assets/rich-dad-poor-dad-cover22.jpg'},
      {'image': 'assets/trade1.webp'},
      {'image': 'assets/trad2.jpg'},
      {'image': 'assets/danger3.webp'},
      {'image': 'assets/indais.jpg'},
      {'image': 'assets/Romance+Unleashed+by+Diana+Plamer.jpg'},
      {'image': 'assets/adu.jpg'},
      {'image': 'assets/rich-dad-poor-dad-cover22.jpg'},
      {'image': 'assets/trade1.webp'},
      {'image': 'assets/trad2.jpg'},
      {'image': 'assets/danger3.webp'},
      {'image': 'assets/indais.jpg'},
      {'image': 'assets/Romance+Unleashed+by+Diana+Plamer.jpg'},
      {'image': 'assets/adu.jpg'},
    ];


    return SafeArea(
        child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(MediaQuery.of(context).size.width, 200),
                        painter: HeaderCurvedContainer(),
                      ),
                      Positioned(
                        top: 35,
                        left: 0,
                        right: 0,
                        child: FractionallySizedBox(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Book store",
                                style: TextStyle(
                                  color: HexColor("DEDADA"),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.lora().fontFamily,
                                  shadows: const [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(2, 2)),
                                  ],
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.08, // Adjust this factor to control the font size relative to the screen width
                                ),
                                textAlign: TextAlign.center,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.25,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * .04,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          provider.storetab1();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 38,
                                          width: 106,
                                          decoration: BoxDecoration(
                                            color: provider.storeselectedIndex == 0
                                                ? HexColor("C0A0A0")
                                                : Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            "Buy now",
                                            style: TextStyle(
                                              color: provider.storeselectedIndex == 0
                                                  ? Colors.white
                                                  : HexColor("C0A0A0"),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          provider.storetab2();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 38,
                                          width: 106,
                                          decoration: BoxDecoration(
                                            color: provider.storeselectedIndex == 1
                                                ? HexColor("C0A0A0")
                                                : Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            "Sell now",
                                            style: TextStyle(
                                              color: provider.storeselectedIndex == 1
                                                  ? Colors.white
                                                  : HexColor("C0A0A0"),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Visibility(
                                  visible: provider.storeselectedIndex == 0,
                                  child: Container(
                                    height: 460,

                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                      color: HexColor('F8AFAF').withOpacity(0.12),
                                    ),child:  SizedBox(
                                        height: 350,
                                        child: GridView.builder(
                                          padding: const EdgeInsets.all(5),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 0.9,
                                          ),
                                          itemCount: recommended.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return Card(
                                              elevation: 5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        recommended[index]
                                                            ['image']),
                                                    // fit: BoxFit.cover, // Make sure the image covers the container
                                                  ),
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            );
                                          },
                                        )),
                                  ),
                                ),
                                Visibility(
                                  visible: provider.storeselectedIndex == 1,
                                  child: SizedBox(
                                    height: MediaQuery.of(context)
                                                .size
                                                .height >=
                                            555
                                        ? 555
                                        : MediaQuery.of(context).size.height,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
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
                                                  "BOOK DETAILS",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: GoogleFonts.lora().fontFamily,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Card(
                                                  elevation: 4,
                                                  child: Container(
                                                    height: 100,
                                                    width: 140,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(7),
                                                        color: Colors.white),
                                                    child: IconButton(onPressed: () {

                                                    }, icon: Icon(Icons.image,size: 50,))
                                                  )),

                                              const Card(
                                                child: TextField(
                                                  // controller: fullNameController,
                                                  decoration: InputDecoration(
                                                      hintText: "Book Name",
                                                      filled: true,
                                                      isDense: true,
                                                      fillColor: Colors.white,
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide.none),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide.none)),
                                                ),
                                              ),
                                              const Card(
                                                child: TextField(
                                                  // controller: ageController,
                                                  decoration: InputDecoration(
                                                      hintText: "Author Name",
                                                      filled: true,
                                                      isDense: true,
                                                      fillColor: Colors.white,
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide.none),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide.none)),
                                                ),
                                              ),
                                              const Card(
                                                child: TextField(
                                                  // controller: genderController,
                                                  decoration: InputDecoration(
                                                      hintText: "Add price",
                                                      filled: true,
                                                      isDense: true,
                                                      fillColor: Colors.white,
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide.none),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide.none)),
                                                ),
                                              ),
                                              const Card(
                                                child: TextField(
                                                  // controller: phoneNumberController,
                                                  decoration: InputDecoration(
                                                      hintText: "Publisher",
                                                      filled: true,
                                                      isDense: true,
                                                      fillColor: Colors.white,
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide.none),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide.none)),
                                                ),
                                              ),
                                              const Card(
                                                child: TextField(
                                                  // controller: mailIDController,
                                                  decoration: InputDecoration(
                                                      hintText: "Description",
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
                                                  // authProvider.signUp(
                                                  //   fullNameController.text,
                                                  //   ageController.text,
                                                  //   genderController.text,
                                                  //   phoneNumberController.text,
                                                  //   mailIDController.text,
                                                  //   passwordController.text,
                                                  //   context,
                                                  // ); // <- Add a semicolon here

                                                },
                                                child: Card(
                                                  elevation: 8,
                                                  child: InkWell(onTap: (){
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(8)),
                                                          backgroundColor: HexColor('C0A0A0'),
                                                          title: const Text(
                                                            "Are you sure,\nYou want to sell your book here?",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 19),
                                                          ),
                                                          actions:  [
                                                            InkWell(onTap: () {
                                                              Navigator.pop(context);
                                                            },
                                                              child: Text(
                                                                "Cancel",
                                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                            InkWell(onTap: () {

                                                            },
                                                              child: Text(
                                                                "CONFIRM",
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.white,
                                                                    shadows: [
                                                                      Shadow(
                                                                          offset: Offset(3, 3),
                                                                          color: Colors.black)
                                                                    ]),
                                                              ),
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
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
                                                        "Sell Now",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w600,
                                                        ),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

        ));
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

Widget buildTextField(String hintText) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10),
    child: Card(color: Colors.white,
      elevation: 2,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: HexColor("000000").withOpacity(0.38),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        // Optional icon
        ),
      ),
    ),
  );
}
