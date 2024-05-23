import 'package:bookverse/Views/users/book_details.dart';
import 'package:bookverse/Views/users/public_book_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/Providers/provider.dart';
import '../../widget_model/shimmer_effect.dart';

class PublictionDetail extends StatelessWidget {
  final String img;
  final String title;
  final String location;
  final String docId;

  const PublictionDetail({super.key, required this.img, required this.title,required this.location,required this.docId});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> allBooks = [
      {'image': 'assets/stanger things.png'},
      {'image': 'assets/chemmeen-thakazhi-malayalam-novel-original-imagn9tknkyphguv 2.png'},
      {'image': 'assets/balyakhalasakhi.png'},
      {'image': 'assets/the kite.png'},
      {'image': 'assets/thealchemist.png'},
      {'image': 'assets/menondrem.png'},
      {'image': 'assets/41TMsXTdOfL.jpg'},
      {'image': 'assets/first skha.jpg'},
      {'image': 'assets/madhavikutty.jpg'},
      {'image': 'assets/manifest.jpg'},
      {'image': 'assets/Manthalirile-20-Communist-Varshangal-benyamin-novels-and-stories.webp'},
      {'image': 'assets/annammakutty.png'},
    ];
    final provider = Provider.of<UserProviders>(context);
    final width = MediaQuery.of(context).size.width;

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
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                              height: MediaQuery.of(context).size.width * .05,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    elevation: 8,
                                    child: Container(
                                      height:
                                      MediaQuery.of(context).size.height *
                                          .30,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            img,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, bottom: 2, top: 5),
                                    child: Text(
                                      title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                                color: Colors.grey,
                                                offset: Offset(2, 2),
                                                blurRadius: 5)
                                          ]),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        location,
                                        style: TextStyle(
                                          fontSize: width * .03,
                                          shadows: const [
                                            Shadow(
                                                color: Colors.grey,
                                                offset: Offset(2, 2),
                                                blurRadius: 5)
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Available Books:",
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                  DropdownButton(
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    value: provider.selectedPubCategory,
                                    items: const [
                                      // DropdownMenuItem(value: "Category", child: Text("Category")),
                                      DropdownMenuItem(value: "Novel", child: Text("Novel")),
                                      DropdownMenuItem(value: "Short story", child: Text("Short story")),
                                      DropdownMenuItem(value: "Science-fiction", child: Text("Science-fiction")),
                                      DropdownMenuItem(value: "Adventure", child: Text("Adventure")),
                                    ],
                                    onChanged: (value) {
                                      provider.dropDownBtn(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 355,
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('publications')
                                    .doc(docId)
                                    .collection("books")
                                    .where('category', isEqualTo: provider.selectedPubCategory)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return buildShimmerGridView();
                                  }
                                  if (snapshot.hasData) {
                                    if (snapshot.data!.docs.isNotEmpty) {
                                      return GridView.builder(
                                        padding: const EdgeInsets.all(5),
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 0.7,
                                        ),
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              // Handle book selection
                                            },
                                            child: Card(
                                              elevation: 5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(snapshot.data!.docs[index]['imageURL']),
                                                  ),
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return Center(child: Text('No Books available in this category'));
                                    }
                                  } else if (snapshot.hasError) {
                                    return Center(child: Text('Error: ${snapshot.error}'));
                                  } else {
                                    return Center(child: Text('No Data'));
                                  }
                                },
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
