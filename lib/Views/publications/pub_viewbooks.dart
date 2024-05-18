import 'package:bookverse/Views/library/add_books.dart';
import 'package:bookverse/Views/users/book_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../Controller/Providers/provider.dart';
import '../../widget_model/shimmer_effect.dart';

class PubViewBooks extends StatelessWidget {
  const PubViewBooks({super.key});

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
    final libraryBooks = FirebaseFirestore.instance
        .collection('publications')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("books");
    final provider = Provider.of<UserProviders>(context);
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
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
                            color: HexColor("C0A0A0"),
                            borderRadius: BorderRadius.circular(10),
                            // image: DecorationImage(
                            //   fit: BoxFit.cover,
                            //   image: AssetImage('assets/3book.webp'),
                            // ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_box,
                              color: Colors.black38,
                              size: 55,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
                        child: Text(
                          'InterNational Library',
                          style: TextStyle(
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
                            "Thiruvananthapuram, Kerala, India",
                            style: TextStyle(
                              fontSize: width * .04,
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
                        value: provider.selectedCategory,
                        items: const [
                          DropdownMenuItem(
                              value: "Category", child: Text("Category")),
                          DropdownMenuItem(
                              value: "Novel", child: Text("Novel")),
                          DropdownMenuItem(
                              value: "Short story", child: Text("Short story")),
                          DropdownMenuItem(
                              value: "Science-fiction",
                              child: Text("Science-fiction")),
                          DropdownMenuItem(
                              value: "Adventure", child: Text("Adventure")),
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
                  child: StreamBuilder<Object>(
                    stream: libraryBooks.snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return buildShimmerGridView();
                      }
                      if (snapshot.hasData) {
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BooksDetail(
                                      img: snapshot.data!.docs[index]['imageURL'],
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        snapshot.data!.docs[index]['imageURL'],
                                      ),
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return Center(
                          child: Text('No Data'),
                        );
                      }
                    },
                  ),
                ),


              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          backgroundColor: HexColor("C0A0A0"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddBooks(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
