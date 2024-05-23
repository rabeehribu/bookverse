import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';



class OurPublictions extends StatelessWidget {
  final String userId;

  OurPublictions({required this.userId});

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
              widthFactor:
              0.6,
              alignment: Alignment.center,
              child: Text(
                "Our Library",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.lora().fontFamily,
                  shadows: const [
                    Shadow(color: Colors.black, offset: Offset(2, 2))
                  ],
                  fontSize: MediaQuery.of(context).size.width *
                      0.06,
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
                  .collection('publications').where('status',isEqualTo: 'accepted')
                  .snapshots(),
              builder: (context, snapshot) {
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
                    final libraryId = libraryData.id; // Get the document ID

                    print(
                        'Library Data: ${libraryData.data()}'); // Debugging statement

                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, bottom: 10),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: () {

                          },
                          child: ListTile(
                            trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(5)),
                                      title: Text("Confirm Deletion"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              deleteLibrary(libraryId);
                                            },
                                            child: Text("Delete",style: TextStyle(color: Colors.black),)),
                                        TextButton(onPressed: () {
                                          Navigator.pop(context);
                                        }, child: Text("Cancel",style: TextStyle(color: Colors.black),))
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.delete),
                            ),
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
                                    NetworkImage(libraryData['publicationImg']),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(libraryData['publicationName']),
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

  void deleteLibrary(String libraryId) async {
    try {
      await FirebaseFirestore.instance
          .collection('acceptedLibraries')
          .doc(libraryId)
          .delete();
      print('Library deleted: $libraryId');
    } catch (e) {
      print('Error deleting library: $e');
    }
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
