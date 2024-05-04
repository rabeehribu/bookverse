import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Controller/Providers/provider.dart'; // Import HexColor if not already imported

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavBarProvider(),
      child: Consumer<BottomNavBarProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: Stack(
              children: <Widget>[
                provider.widgetOptions.elementAt(provider.selectedIndex),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 5),
                      child: Card(elevation: 4,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor("FFFFFF"),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              _buildNavItem(Icons.home, 'Home', 0, provider),
                              _buildNavItem(Icons.library_books_outlined, 'Library', 1, provider),
                              _buildNavItem(Icons.menu_book_sharp, 'Publications', 2, provider),
                              _buildNavItem(Icons.store, 'Book store', 3, provider),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, int index, BottomNavBarProvider provider) {
    return GestureDetector(
      onTap: () {
        provider.onItemTapped(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: provider.selectedIndex == index ? Colors.black : Colors.grey,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: provider.selectedIndex == index ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}


// class UserProviders extends ChangeNotifier {
//   // Your UserProviders class remains unchanged
// }
