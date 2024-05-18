import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerGridView() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: GridView.builder(
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
      ),
      itemCount: 6, // Define how many shimmer items you want to show
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {}, // Handle shimmer tap if required
          child: Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
Widget buildShimmerCard(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Card(
      elevation: 8,
      child: Container(
        height: MediaQuery.of(context).size.height * .30,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: HexColor("C0A0A0"),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget buildShimmerText(double width) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      width: width * 0.5,
      height: 20.0,
      color: Colors.grey[300],
    ),
  );
}

Widget buildShimmerRow(double width) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Row(
      children: [
        const Icon(
          Icons.location_on,
          color: Colors.grey,
        ),
        Container(
          width: width * 0.5,
          height: 20.0,
          color: Colors.grey[300],
        ),
      ],
    ),
  );
}
