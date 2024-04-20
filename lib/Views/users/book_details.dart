import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/Providers/provider.dart';

class BooksDetail extends StatelessWidget {
  final String img;

  const BooksDetail({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> allBooks = [
      {'image': 'assets/stanger things.png'},
      {
        'image':
            'assets/chemmeen-thakazhi-malayalam-novel-original-imagn9tknkyphguv 2.png'
      },
      {'image': 'assets/balyakhalasakhi.png'},
      {'image': 'assets/the kite.png'},
      {'image': 'assets/thealchemist.png'},
      {'image': 'assets/menondrem.png'},
      {'image': 'assets/41TMsXTdOfL.jpg'},
      {'image': 'assets/first skha.jpg'},
      {'image': 'assets/madhavikutty.jpg'},
      {'image': 'assets/manifest.jpg'},
      {
        'image':
            'assets/Manthalirile-20-Communist-Varshangal-benyamin-novels-and-stories.webp'
      },
      {'image': 'assets/annammakutty.png'},
    ];
    List<Map<String, dynamic>> authorDetails = [
      {'1': 'Book Name', '2': 'Aadujeevitham'},
      {'1': 'Author', '2': 'Benyamin'},
      {'1': 'Category', '2': 'Novel'},
      {'1': 'Genre', '2': 'Fiction'},
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
                                          image: AssetImage(img),
                                          fit: BoxFit.fill,
                                        ),
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, bottom: 2, top: 5),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        itemSize: 20,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                  ),
                                  // Adding Author Details

                                  Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: authorDetails.map((detail) {
                                        return buildDetailItem(
                                            detail['1'], detail['2']);
                                      }).toList(),
                                    ),
                                  ),
                                  const Text(
                                    "Description",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        decoration: TextDecoration.underline),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '''Aadujeevitham is a novel which had a theme of hope wrapped inside it. Najeeb had a lot of hopes, dreamsand desires of his gulf life. But he was subjected to thebitter sufferings in the desert and now he had learnt toaccept the truth that his dreams and desires were nomore and he cannot escape from these sand dunes.''',
                                      maxLines: provider.isExpanded ? null : 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      provider.textOverflow();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        provider.isExpanded
                                            ? 'Read more...'
                                            : 'Read less',
                                        style: const TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                             const Padding(
                               padding: EdgeInsets.symmetric(horizontal: 7.0),
                               child: Align(alignment: Alignment.centerLeft,
                                 child: Text(
                                  "Reviews",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      decoration: TextDecoration.underline),
                                  textAlign: TextAlign.center,
                                                             ),
                               ),
                             ),
                            const Card(
                              elevation: 4,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        radius: 25,
                                        backgroundImage:
                                            AssetImage("assets/profile.png"),
                                      ),
                                      title: Text(
                                        "Starbi",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            "4.2",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.black,size: 18,
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '''Aadujeevitham is a novel which had a theme of hope wrapped inside it. Najeeb had a lot of hopes, dreamsand desires of his gulf life. But he was subjected to the''',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
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

Widget buildDetailItem(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 8.0), // Adjust the padding as needed
    child: Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
