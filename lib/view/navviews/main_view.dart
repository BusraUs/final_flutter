import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_sanliurfa/view/navviews/exit_view.dart';
import 'package:flutter_app_sanliurfa/view/navviews/home_view.dart';
import 'package:flutter_app_sanliurfa/view/navviews/my_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List viwes = [
    HomeView(),
    MyView(),
    ExitView(),
  ];

  int currentIndex = 0;
  void ontap(int index) {
    setState(() {
      currentIndex = index;
      if (currentIndex == 3) {
        SystemNavigator.pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: viwes[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedFontSize: 15,
        unselectedFontSize: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app), label: "Çıkış"),
        ],
      ),
    );
  }
}
