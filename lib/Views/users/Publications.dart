import 'package:bookverse/Views/users/library_detail_page.dart';
import 'package:bookverse/Views/users/publiction_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/Providers/provider.dart';
import '../../widget_model/drwer.dart';

class UsersPublications extends StatelessWidget {
  const UsersPublications({Key? key});

  @override
  Widget build(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    double fontSize = 16 * scaleFactor;
    List<Map<String, dynamic>> recommended = [
      {'image': 'assets/dcb.png', 'title': "DC BOOKS"},
      {'image': 'assets/curent.png', 'title': "CURRENT BOOKS"},
      {'image': 'assets/mathrabhumi.png', 'title': "MATHRUBHUMI BOOKS"},
      {'image': 'assets/flora.png', 'title': "FLORA BOOKS"},
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
                    top: MediaQuery.of(context).size.height * 0.035,
                    left: 0,
                    right: 0,
                    child: FractionallySizedBox(
                      alignment: Alignment.center,
                      child: Text(
                        "Publications",
                        style: TextStyle(
                          color: HexColor("DEDADA"),
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.lora().fontFamily,
                          shadows: const [
                            Shadow(color: Colors.black, offset: Offset(2, 2)),
                          ],
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Card(
                            elevation: 4,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search books",
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        SizedBox(height: 305,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 10.0, // Spacing between columns
                              mainAxisSpacing: 10.0, // Spacing between rows
                            ),

                            itemCount: recommended.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GridTile(
                                child: GestureDetector(
                                  onTap: () {
                                    // Add your onTap functionality here
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(height: MediaQuery.of(context).size.height*.3,width:  MediaQuery.of(context).size.width*.5,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),image: DecorationImage(fit: BoxFit.cover,image: AssetImage(recommended[index]['image'],)))


                                        ),
                                        Align(alignment: Alignment.bottomCenter,
                                          child: Text(
                                            recommended[index]['title'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
