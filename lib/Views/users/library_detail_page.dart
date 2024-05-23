import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/Providers/provider.dart';
import '../../widget_model/shimmer_effect.dart';

class LibraryListItem extends StatelessWidget {
  final DocumentSnapshot doc;

  const LibraryListItem({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserLibraryDetail(
                    img: doc['libraryImg'],
                    title: doc['libraryName'],
                    location: doc['location'],
                    docId: doc.id,  // Pass the document ID to fetch books
                  ),
                ),
              );
            },
            child: Card(
              elevation: 8,
              child: Container(
                height: MediaQuery.of(context).size.height * .30,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(doc['libraryImg']),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              doc['libraryName'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 5)
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class UserLibraryDetail extends StatelessWidget {
  final String img;
  final String title;
  final String location;
  final String docId;

  const UserLibraryDetail({
    Key? key,
    required this.img,
    required this.title,
    required this.location,
    required this.docId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        "Library",
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
                              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
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
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    elevation: 8,
                                    child: Container(
                                      height: MediaQuery.of(context).size.height * .30,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(img),
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
                                    child: Text(
                                      title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 5)
                                        ],
                                      ),
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
                                            Shadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 5)
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
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
                                    value: provider.selectedCategory,
                                    items: const [
                                      DropdownMenuItem(value: "Novel", child: Text("Novel")),
                                      DropdownMenuItem(value: "Short story", child: Text("Short story")),
                                      DropdownMenuItem(value: "Science-fiction", child: Text("Science-fiction")),
                                      DropdownMenuItem(value: "Adventure", child: Text("Adventure")),
                                    ],
                                    onChanged: (value) {
                                      provider.dropDown(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 350,
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('library')
                                    .doc(docId)  // Use the passed document ID here
                                    .collection("books")
                                    .where('category', isEqualTo: provider.selectedCategory)
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
