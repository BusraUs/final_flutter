import 'package:flutter/material.dart';
import 'package:flutter_app_sanliurfa/core/colors.dart';
import 'package:flutter_app_sanliurfa/view/login_screen.dart';
import 'package:flutter_app_sanliurfa/widget/responsive_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TanitimSayfasi extends StatefulWidget {
  const TanitimSayfasi({Key? key}) : super(key: key);

  @override
  _TanitimSayfasiState createState() => _TanitimSayfasiState();
}

class _TanitimSayfasiState extends State<TanitimSayfasi> {
  List resim = [
    "1.png",
    "2.png",
    "3.png",
  ];

  @override
  void initState() {
    super.initState();
    _updateSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: resim.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/" + resim[index]),
                    fit: BoxFit.cover)),
            child: Container(
              margin: EdgeInsets.only(
                bottom: 10,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      butoon(elemanSayisi: resim.length, indexDegeri: index),
                      SizedBox(height: 10),
                    ],
                  ),
                  Row(
                    children: List.generate(resim.length, (indexDots) {
                      return Center(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(bottom: 650, right: 5),
                          width: 10,
                          height: index == indexDots ? 17 : 12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(0.4)),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}

class butoon extends StatelessWidget {
  int elemanSayisi;
  int indexDegeri;

  butoon({required this.elemanSayisi, required this.indexDegeri});

  @override
  Widget build(BuildContext context) {
    if (elemanSayisi == indexDegeri + 1) {
      return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: ResponsiveButton(width: 300));
    } else {
      return ResponsiveButton(width: 0);
    }
  }
}
