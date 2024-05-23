import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../Controller/library_controller.dart';
import 'lib accept or reject.dart';

class RequestsLibrary extends StatelessWidget {
  RequestsLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 200),
            painter: HeaderCurvedContainer(),
          ),
          Positioned(
            top: 65,
            left: 0,
            right: 0,
            child: FractionallySizedBox(
              widthFactor: 0.7,
              alignment: Alignment.center,
              child: Text(
                "Library",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.lora().fontFamily,
                  shadows: const [
                    Shadow(color: Colors.black, offset: Offset(2, 2))
                  ],
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 180),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('library')
                  // .where('status', isEqualTo: 'rejected')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return buildShimmerListView();
                }

                if (snapshot.hasError) {
                  print('Error fetching data: ${snapshot.error}');
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  print('No data found');
                  return Center(child: Text('No library requests found.'));
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final libraryData = snapshot.data!.docs[index];

                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LibraryAcceptorNot(
                                        name: libraryData['libraryName'],
                                        location: libraryData['location'],
                                        phone: libraryData[
                                            'phoneNum'], // Corrected field name
                                        email: libraryData[
                                            'email'], // Corrected field name
                                        image: libraryData['libraryImg'],
                                        libraryId: libraryData.id,
                                      )));
                        },
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListTile(
                            leading: Card(
                              elevation: 3,
                              child: Container(
                                height: 100,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(libraryData['libraryImg']),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(libraryData['libraryName']),
                            subtitle: Text(libraryData['location']),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShimmerListView() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                leading: Card(
                  elevation: 3,
                  child: Container(
                    height: 100,
                    width: 80,
                    color: Colors.white,
                  ),
                ),
                title: Container(
                  height: 10,
                  width: 80,
                  color: Colors.white,
                ),
                subtitle: Container(
                  height: 10,
                  width: 60,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
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
