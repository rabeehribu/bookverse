import 'package:bookverse/Views/users/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/Providers/provider.dart';
import '../../widget_model/drwer.dart';
import 'my_library.dart';
import 'my_publication.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key});

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

    List<Map<String, dynamic>> allBooks = [
      {'image': 'assets/chemminorg.jpg'},
      {'image': 'assets/bahsrer.jpg'},
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

    List<Map<String, dynamic>> bookOfTheWeek = [
      {
        'widget': Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [HexColor("C0A0A0"), HexColor("FFFFFF")],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Book of the week",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.lora().fontFamily,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        shadows: const [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 4,
                        child: Container(
                          alignment: Alignment.center,
                          height: 38,
                          width: 106,
                          decoration: BoxDecoration(
                            color: HexColor("C0A0A0"),
                          ),
                          child: const Text(
                            "BUY NOW",
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
                Container(
                  height: 140,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/rich-dad-poor-dad-cover22.jpg"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      },
      {
        'widget': Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [HexColor("C0A0A0"), HexColor("FFFFFF")],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Book of the week",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.lora().fontFamily,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        shadows: const [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 4,
                        child: Container(
                          alignment: Alignment.center,
                          height: 38,
                          width: 106,
                          decoration: BoxDecoration(
                            color: HexColor("C0A0A0"),
                          ),
                          child: const Text(
                            "BUY NOW",
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
                Container(
                  height: 140,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/agatha2.jpg"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      },
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
                                "BookVerse",
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
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, right: 10, left: 10),
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
                                const SizedBox(height: 5),
                                CarouselSlider(
                                  items: bookOfTheWeek
                                      .map<Widget>((item) => item['widget'])
                                      .toList(),
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    viewportFraction: 1,
                                    aspectRatio: 16 / 8,
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * .04,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        provider.tab1();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 38,
                                        width: 106,
                                        decoration: BoxDecoration(
                                          color: provider.selectedIndex == 0
                                              ? HexColor("C0A0A0")
                                              : Colors.white,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          "Recommended",
                                          style: TextStyle(
                                            color: provider.selectedIndex == 0
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
                                        provider.tab2();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 38,
                                        width: 106,
                                        decoration: BoxDecoration(
                                          color: provider.selectedIndex == 1
                                              ? HexColor("C0A0A0")
                                              : Colors.white,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          "All Books",
                                          style: TextStyle(
                                            color: provider.selectedIndex == 1
                                                ? Colors.white
                                                : HexColor("C0A0A0"),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Visibility(
                                  visible: provider.selectedIndex == 0,
                                  child: SizedBox(
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
                                Visibility(
                                  visible: provider.selectedIndex == 1,
                                  child: SizedBox(
                                    height: 350,
                                    child: GridView.builder(
                                      padding: const EdgeInsets.all(5),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 0.9,
                                      ),
                                      // physics:  NeverScrollableScrollPhysics(),
                                      itemCount: allBooks.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                          elevation: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    allBooks[index]['image']),
                                              ),
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        );
                                      },
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
            drawer: Drawer(
                backgroundColor: HexColor("C0A0A0"),
                child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: HexColor("CCC4C4"),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BookVerse",
                          style: TextStyle(
                            color: HexColor("DEDADA"),
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.lora().fontFamily,
                            shadows: const [
                              Shadow(color: Colors.black, offset: Offset(2, 2)),
                            ],
                            fontSize: MediaQuery.of(context).size.width *
                                0.08, // Adjust this factor to control the font size relative to the screen width
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ));
                      },
                      child: buildDrawerItem(Icons.person, " Profile")),
                  buildDrawerItem(Icons.error, "About"),
                  buildDrawerItem(Icons.quiz, "FAQ"),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyLibrary()));
                      },
                      child: buildDrawerItem(
                          Icons.library_books_rounded, "My Library")),
                  InkWell(onTap: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                    MyPublication()));
                  },child: buildDrawerItem(Icons.menu_book_rounded, "My Publication")),
                ]))));
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
