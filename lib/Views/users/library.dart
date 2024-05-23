import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bookverse/Views/users/library_detail_page.dart';

class UserLibrary extends StatelessWidget {
  const UserLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
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
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('library')
                                  .where('status', isEqualTo: 'accepted')
                                  .snapshots(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                }

                                if (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty) {
                                  return const Center(
                                      child: Text('No library data found.'));
                                }

                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.all(5),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final doc = snapshot.data!.docs[index];
                                    return LibraryListItem(doc: doc);
                                  },
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
      ),
    );
  }
}

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
                    docId: doc['libraryId'],
                    // category: "",
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
                  Shadow(
                      color: Colors.grey, offset: Offset(2, 2), blurRadius: 5)
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
