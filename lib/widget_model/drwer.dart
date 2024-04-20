import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildDrawerItem(IconData icon, String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0,right: 8,top: 2),
    child: Container(color: HexColor("D9D9D9"),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}