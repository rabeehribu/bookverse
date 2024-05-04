import 'package:bookverse/Views/users/library_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/Providers/provider.dart';
import '../../widget_model/drwer.dart';

class UserLibrary extends StatelessWidget {
  const UserLibrary({Key? key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> recommended = [
      {'image': 'assets/National_Library,_Calcutta_2007 1.png','title':"NATIONAL LIBRARY OF INDIA, KOLKATA"},
      {'image': 'assets/3book.webp','title':"NATIONAL LIBRARY OF INDIA, KOLKATA"},
      {'image': 'assets/alipore.jpeg','title':"NATIONAL LIBRARY OF INDIA, KOLKATA"},
      {'image': 'assets/4books.jpg','title':"NATIONAL LIBRARY OF INDIA, KOLKATA"},
      {'image': 'assets/National_Library,_Calcutta_2007 1.png','title':"NATIONAL LIBRARY OF INDIA, KOLKATA"},
      {'image': 'assets/3book.webp','title':"NATIONAL LIBRARY OF INDIA, KOLKATA"},
      {'image': 'assets/alipore.jpeg','title':"NATIONAL LIBRARY OF INDIA, KOLKATA"},
      {'image': 'assets/4books.jpg','title':"NATIONAL LIBRARY OF INDIA, KOLKATA"},

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
                          child: Text(
                            "Library",
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
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.25,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0,right: 10,left: 10),
                                  child: Card(elevation: 4,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * .05,
                                ),
                                ListView.builder(scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.all(5),
                                  shrinkWrap: true,
                                  itemCount: recommended.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 7),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => UserLibraryDetail(img:recommended[index]['image'],title:recommended[index]['title']),));
                                          },
                                            child: Card(
                                              elevation: 8,
                                              child: Container(height: MediaQuery.of(context).size.height*.30,width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        recommended[index]
                                                            ['image']),
                                                    fit: BoxFit.cover, // Make sure the image covers the container
                                                  ),
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Text(recommended[index]['title'],style: const TextStyle(fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.grey,offset: Offset(2, 2),blurRadius: 5)]),textAlign: TextAlign.center,),
                                          ),

                                        ],
                                      ),
                                    );
                                  },
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
