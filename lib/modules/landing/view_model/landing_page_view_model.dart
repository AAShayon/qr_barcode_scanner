

import 'package:flutter/material.dart';
import 'package:qr_barcode_scanner/modules/home/view/home_page.dart';

class LandingPageViewModel with ChangeNotifier{
  int _selectedIndex = 0;

  final List<Widget> _homePageBodyWidgetList = <Widget>[
    const HomePage(),
    const Text('History Page'),
    const Text('Favorite Page'),
    const Text('Settings Page'),
  ];

  void onItemTapped(int index) {
      _selectedIndex = index;
      notifyListeners();
  }

  /*------------------getters--------------------------------------*/
  int get selectedIndex=> _selectedIndex;
  List<Widget>  get homePageBodyWidgetList=> _homePageBodyWidgetList;
}