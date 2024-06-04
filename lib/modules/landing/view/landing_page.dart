import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_barcode_scanner/modules/landing/view_model/landing_page_view_model.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery=MediaQuery.of(context);
    return Consumer<LandingPageViewModel>(
      builder: (context,homePageViewModel,child) {
        return Scaffold(
          backgroundColor: Colors.green.shade50,
          appBar: AppBar(
            backgroundColor: Colors.green.shade500,
            title: const Text("BarCode Scanner"),
            centerTitle: true,
          ),
          body: homePageViewModel.homePageBodyWidgetList[homePageViewModel.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.green.shade200,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: homePageViewModel.selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            unselectedFontSize: 13,
            onTap: homePageViewModel.onItemTapped,
          ),
        );
      }
    );
  }
}
