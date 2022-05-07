import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_sanliurfa/view/login_screen.dart';

import 'package:flutter_app_sanliurfa/view/tanitim_sayfasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen;
  seen = prefs.getBool('seen')!;
  Widget _screen;
  if (seen == null || seen == false) {
    _screen = TanitimSayfasi();
  } else {
    _screen = LoginScreen();
  }

  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
  final Widget _screen;
  MyApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BUWED APP',
      home: this._screen,
    );
  }
}
