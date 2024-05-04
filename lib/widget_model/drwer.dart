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
// GridView.builder(
//   // physics: BouncingScrollPhysics(),
//   gridDelegate:
//       const SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2, // Number of columns
//     crossAxisSpacing: 10.0, // Spacing between columns
//     mainAxisSpacing: 10.0, // Spacing between rows
//   ),
//
//   itemCount: recommended.length,
//   itemBuilder: (BuildContext context, int index) {
//     return GridTile(
//       child: GestureDetector(
//         onTap: () {
//           // Add your onTap functionality here
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Card(elevation: 7,
//             child: Stack(
//               children: <Widget>[
//                 Container(height: MediaQuery.of(context).size.height*.3,width:  MediaQuery.of(context).size.width*.5,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),image: DecorationImage(fit: BoxFit.cover,image: AssetImage(recommended[index]['image'],)))
//
//
//                 ),
//                 Align(alignment: Alignment.bottomCenter,
//                   child: Container(alignment: Alignment.center,height: 25,width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),bottomLeft: Radius.circular(8)),color: Colors.black26.withOpacity(0.4)),
//                     child: Text(
//                       recommended[index]['title'],
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,color: Colors.white
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   },
// ),