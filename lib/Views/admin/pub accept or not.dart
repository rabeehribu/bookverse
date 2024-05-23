import 'package:bookverse/Controller/publication_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../Controller/library_controller.dart';
import '../../widget_model/head_curve_container.dart';
import 'ourlibrarys.dart';

class PublicationsAcceptorNot extends StatefulWidget {
  final String name;
  final String location;
  final String phone;
  final String image;
  final String email;
  final String libraryId; // Add this to identify the library document in Firestore

  const PublicationsAcceptorNot({
    Key? key,
    required this.name,
    required this.phone,
    required this.location,
    required this.image,
    required this.email,
    required this.libraryId, // Add this to identify the library document in Firestore
  }) : super(key: key);

  @override
  _PublicationsAcceptorNotState createState() => _PublicationsAcceptorNotState();
}

class _PublicationsAcceptorNotState extends State<PublicationsAcceptorNot> {


  @override
  Widget build(BuildContext context) {
    final libAuthProvider = Provider.of<PublicationAuthenticationProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // CustomPaint(
          //   size: Size(MediaQuery.of(context).size.width, 200),
          //   painter: HeaderCurvedContainer(),
          // ),
          Positioned(
            top: 65,
            left: 0,
            right: 0,
            child: FractionallySizedBox(
              widthFactor: 0.6,
              alignment: Alignment.center,
              child: Text(
                "publications",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.lora().fontFamily,
                  shadows: const [Shadow(color: Colors.black, offset: Offset(2, 2))],
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 170),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 460,
                      width: 310,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('F8AFAF').withOpacity(0.12),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "publications REQUEST",
                              style: TextStyle(
                                fontSize: 15,
                                color: HexColor("000000"),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Card(
                                  elevation: 4,
                                  child: Container(
                                    height: 100,
                                    width: 125,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                      image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(widget.image)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            buildContainer(widget.name),
                            SizedBox(height: 2),
                            buildContainer(widget.location),
                            SizedBox(height: 2),
                            buildContainer(widget.phone),
                            SizedBox(height: 2),
                            buildContainer(widget.email),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    libAuthProvider.acceptLibraryRequest(widget.libraryId, context);
                                    // Navigate to the page displaying accepted libraries
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OurLibrary(userId: widget.libraryId)));
                                  },
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
                                        "ACCEPT",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 30),
                                InkWell(
                                  onTap: () {
                                    libAuthProvider.rejectLibraryRequest(widget.libraryId, context);
                                    // Navigate back to the previous screen after rejecting the request
                                    Navigator.pop(context);
                                  },
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
                                        "REJECT",
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainer(String hintText) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Card(
        elevation: 2,
        child: Container(
          width: 270,
          height: 45,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              hintText,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: HexColor("000000").withOpacity(0.38),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
