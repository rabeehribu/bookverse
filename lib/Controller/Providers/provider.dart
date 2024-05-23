import 'package:bookverse/Views/admin/Publications.dart';
import 'package:bookverse/Views/users/Publications.dart';
import 'package:flutter/material.dart';

import '../../Views/users/book_store.dart';
import '../../Views/users/home.dart';
import '../../Views/users/library.dart';

class UserProviders extends ChangeNotifier {
  int selectedIndex = 0;
  int storeselectedIndex = 0;
  int libselectedIndex = 0;
  int pubselectedIndex = 0;


  void tab1() {
    selectedIndex = 0;
    notifyListeners();
  }

  void tab2() {
    selectedIndex = 1;
    notifyListeners();
  }


  String selectedCategory = "Novel";
  void dropDown(value) {
    selectedCategory = value.toString();
    notifyListeners();
  }

  String selectedPubCategory = "Novel";
  void dropDownBtn(value) {
    selectedPubCategory = value.toString();
    notifyListeners();
  }
  String userSelectedCategory = "Novel";
  void dropDownUser(value) {
    userSelectedCategory = value.toString();
    notifyListeners();
  }
  bool isExpanded = false;

  void textOverflow(){
    isExpanded = !isExpanded;
    notifyListeners();
  }
  var isOn = false;
  void switch1(value){
isOn = value;
notifyListeners();
}
var tick = true;
  void tickIcon1(){
    tick=!tick;
    notifyListeners();
  }
  var tick2 = true;
  void tickIcon2(){
    tick2=!tick2;
    notifyListeners();
  }
  var tick3 = true;
  void tickIcon3(){
    tick3=!tick3;
    notifyListeners();
  }
  var tick4 = true;
  void tickIcon4(){
    tick4=!tick4;
    notifyListeners();
  }
  var tick5 = true;
  void tickIcon5(){
    tick5=!tick5;
    notifyListeners();
  }
  void storetab1() {
    storeselectedIndex = 0;
    notifyListeners();
  }

  void storetab2() {
    storeselectedIndex = 1;
    notifyListeners();
  }
  void mylib1() {
    libselectedIndex = 0;
    notifyListeners();
  }

  void mylib2() {
    libselectedIndex = 1;
    notifyListeners();
  }
  void mypub1() {
    pubselectedIndex = 0;
    notifyListeners();
  }

  void mypub2() {
    pubselectedIndex = 1;
    notifyListeners();
  }


}
class BottomNavBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    UserHome(), UserLibrary(), UsersPublications(), Bookstore()
  ];

  int get selectedIndex => _selectedIndex;
  List<Widget> get widgetOptions => _widgetOptions;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}