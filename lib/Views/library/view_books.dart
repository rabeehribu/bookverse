// ViewBooks Widget

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../../Controller/Providers/provider.dart';
import '../../Controller/library_controller.dart';
import '../../Model/library_model.dart';
import '../../widget_model/shimmer_effect.dart';

class ViewBooks extends StatelessWidget {
  ViewBooks({super.key});
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final lib = FirebaseFirestore.instance.collection('library');
    final libraryBooks =
        lib.doc(FirebaseAuth.instance.currentUser!.uid).collection("books");
    final provider = Provider.of<UserProviders>(context);
    final libAuthProvider = Provider.of<LibraryAuthenticationProvider>(context);
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(children: [
                  SizedBox(height: 10),
                  SizedBox(height: MediaQuery.of(context).size.width * .05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(children: [
                      SizedBox(height: 10),
                      SizedBox(height: MediaQuery.of(context).size.width * .05),
                    StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream:FirebaseFirestore.instance.collection('library').doc(FirebaseAuth.instance.currentUser!.uid).snapshots() ,
                        builder: (context,AsyncSnapshot snapshot) {
                          // final index = snapshot.data!.docs.length - 1;
                          // final libraryData = snapshot.data!.docs[index];
                  if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show loading indicator
                  }
                  if (snapshot.hasData) {
                  final library = snapshot.data!;
                  return Card(
                  elevation: 8,
                  child: Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                  image: library["libraryImg"] != null
                  ? DecorationImage(
                  image: NetworkImage(library["libraryImg"]),
                  fit: BoxFit.cover,
                  )
                      : null,
                  color: HexColor("C0A0A0"),
                  borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                  onPressed: () async {
                  final pickedImage = await picker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    libAuthProvider.uploadImage(File((pickedImage.path))).then((url)async {
                      // LibraryModel updatedLibrary = LibraryModel(
                      //   libraryId: library.libraryId,
                      //   email: library.email,
                      //   libraryName: library.libraryName,
                      //   location: library.location,
                      //   libraryImg: url, // Set the image path
                      // );
                      // Call updateLibrary function to update the image
                      await libAuthProvider.updateLibrary(url, context);

                    });
                  // Create a new LibraryModel with the updated image URL

                  }
                  },
                  icon: Icon(
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
                  )
,
                  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: lib.snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildShimmerCard(context),
                                  SizedBox(height: 10),
                                  buildShimmerText(width),
                                  SizedBox(height: 5),
                                  buildShimmerRow(width),
                                ],
                              );
                            }

                            if (snapshot.hasData &&
                                snapshot.data!.docs.isNotEmpty) {
                              final index = snapshot.data!.docs.length - 1;
                              final libraryData = snapshot.data!.docs[index];
                              final libraryName =
                                  libraryData['libraryName'] ?? 'Library Name';
                              final location =
                                  libraryData['location'] ?? 'Location';

                              return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, bottom: 2, top: 5),
                                  child: Text(
                                    libraryName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.grey,
                                          offset: Offset(2, 2),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(children: [
                                  const Icon(Icons.location_on,
                                      color: Colors.black),
                                  Text(
                                    location,
                                    style: TextStyle(
                                      fontSize: width * .04,
                                      shadows: const [
                                        Shadow(
                                          color: Colors.grey,
                                          offset: Offset(2, 2),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ])
                              ]);
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else {
                              return const Center(child: Text('No Data'));
                            }
                          },
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
                                    value: "Short story",
                                    child: Text("Short story")),
                                DropdownMenuItem(
                                    value: "Science-fiction",
                                    child: Text("Science-fiction")),
                                DropdownMenuItem(
                                    value: "Adventure",
                                    child: Text("Adventure")),
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
                          stream: libraryBooks.where('category', isEqualTo: provider.selectedCategory).snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return buildShimmerGridView(); // Show shimmer effect while loading
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
                        )


                      ),
                    ]),
                  ),
                ]),
              ),
            )));
  }
}
