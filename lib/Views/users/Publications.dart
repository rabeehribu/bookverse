import 'package:bookverse/Views/users/public_book_details.dart';
import 'package:bookverse/Views/users/publiction_detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class UsersPublications extends StatelessWidget {
  const UsersPublications({Key? key});

  @override
  Widget build(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    double fontSize = 16 * scaleFactor;
    List<Map<String, dynamic>> _data = [
      {'image': 'assets/DCB2.png', 'title': "DC BOOKS"},
      {'image': 'assets/flora2.png', 'title': "CURRENT BOOKS"},
      {'image': 'assets/DCB2.png', 'title': "DC BOOKS"},
      {'image': 'assets/flora2.png', 'title': "CURRENT BOOKS"},
    ];

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
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
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('publications')
                                  .where('status', isEqualTo: 'accepted')
                                  .snapshots(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                return GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder: (context, index) {
                                    final item = _data[index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PublictionDetail(
                                              img: snapshot.data.docs[index]
                                                  ['publicationImg'],
                                              title: snapshot.data.docs[index]
                                                  ['publicationName'],
                                                  location: snapshot.data.docs[index]['location'],
                                                  docId: snapshot.data.docs[index]['publicationId'],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                image: DecorationImage(
                                                  fit: BoxFit.fitHeight,
                                                  image: NetworkImage(
                                                      snapshot.data.docs[index]
                                                          ['publicationImg']),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            snapshot.data.docs[index]
                                                ['publicationName'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }),
                        ],
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
