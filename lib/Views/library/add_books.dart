import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:bookverse/Controller/library_controller.dart';

class AddBooks extends StatefulWidget {
  AddBooks({super.key});

  @override
  _AddBooksState createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {
  String selectedCategory = 'Novel'; // Default to Novel
  final libraryBooks = FirebaseFirestore.instance.collection('library');

  @override
  Widget build(BuildContext context) {
    return Consumer<LibraryAuthenticationProvider>(
      builder: (context, libAuthProvider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: const Text(
              "Add Books",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 125,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: libAuthProvider.bookImage == null
                            ? const AssetImage('assets/3book.webp')
                            : FileImage(File(libAuthProvider.bookImage!.path))
                        as ImageProvider,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        libAuthProvider.selectBookImage(context);
                      },
                      icon: const Icon(
                        Icons.add_box,
                        color: Colors.white70,
                        size: 55,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Upload Image",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                const SizedBox(height: 15),
                _buildTextField(
                    label: "Book name",
                    controller: libAuthProvider.bookNameController),
                const SizedBox(height: 15),
                _buildTextField(
                    label: "Author name",
                    controller: libAuthProvider.authorNameController),
                const SizedBox(height: 15),
                _buildDropDownButton(
                  label: "Category",
                  value: selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                  items: ['Novel', 'Short story', 'Science-fiction', 'Adventure'],
                ),
                const SizedBox(height: 15),
                _buildTextField(
                    label: "Book rate",
                    prefixText: "₹",
                    controller: libAuthProvider.bookRateController),
                const SizedBox(height: 15),
                _buildTextField(
                    label: "About book",
                    maxLines: 4,
                    controller: libAuthProvider.aboutBooksController),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(HexColor("C0A0A0")),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final String bookName =
                          libAuthProvider.bookNameController.text;
                      final String authorName =
                          libAuthProvider.authorNameController.text;
                      final String category = selectedCategory;
                      final String bookRate =
                          libAuthProvider.bookRateController.text;
                      final String aboutBooks =
                          libAuthProvider.aboutBooksController.text;
                      final String imageURL =
                      await libAuthProvider.storeImageToStorage(
                        'Book Images/$bookName',
                        libAuthProvider.bookImage!,
                      );

                      await libAuthProvider.saveBook(bookName, imageURL, authorName, category, bookRate, aboutBooks);
                      // libAuthProvider.clearFields();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Save Book',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    IconData? suffixIcon,
    String? prefixText,
    int maxLines = 1,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(label),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            prefixText: prefixText,
            filled: true,
            fillColor: HexColor("FDFDFD"),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
            suffixIcon: suffixIcon != null
                ? IconButton(
              onPressed: () {},
              icon: Icon(suffixIcon),
            )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildDropDownButton({
    required String label,
    required String value,
    required Function(String?) onChanged,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(label),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'AbhayaLibre_regular',
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            filled: true,
            fillColor: HexColor("FDFDFD"),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
            hintStyle: TextStyle(
              color: HexColor("7A5600"),
              fontFamily: 'AbhayaLibre_regular',
              fontWeight: FontWeight.w600,
            ),
            hintText: 'Select Category',
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: HexColor("7A5600")),
            ),
          ),
        ),
      ],
    );
  }
}
