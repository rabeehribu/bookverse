import 'dart:io';

import 'package:bookverse/Views/library/add_books.dart';
import 'package:bookverse/Views/publications/add_pub_books.dart';
import 'package:bookverse/Views/users/book_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../Controller/Providers/provider.dart';
import '../../Controller/publication_controller.dart';
import '../../widget_model/shimmer_effect.dart';

class PubViewBooks extends StatelessWidget {
   PubViewBooks({super.key});
  final picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    final pubProvider = Provider.of<PublicationAuthenticationProvider>(context);

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
                      StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection('publications')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.hasData) {
                            final library = snapshot.data!;
                            return Card(
                              elevation: 8,
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: library["publicationImg"] != null
                                      ? DecorationImage(
                                    image: NetworkImage(library["publicationImg"]),
                                    fit: BoxFit.cover,
                                  )
                                      : null,
                                  color: HexColor("C0A0A0"),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    final pickedImage =
                                    await picker.pickImage(source: ImageSource.gallery);
                                    if (pickedImage != null) {
                                      pubProvider
                                          .uploadImage(File((pickedImage.path)))
                                          .then((url) async {
                                        await pubProvider.updateLibrary(url, context);
                                      });
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.add_box,
                                    color: Colors.black38,
                                    size: 55,
                                  ),
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Text('No Data');
                          }
                        },
                      ),
                      StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('publications')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }

                            final library = snapshot.data!;
                            return  Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
                                  child: Align(alignment: Alignment.centerLeft,
                                    child: Text(
                                      library['publicationName'],
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
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      library['location'],
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
                                ),      ],
                            );
                          }
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
                        .doc(FirebaseAuth.instance.currentUser!.uid)
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
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          backgroundColor: HexColor("C0A0A0"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PubAddBooks(),
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
