import 'package:flutter/material.dart';
import 'package:flutter_app_sanliurfa/core/colors.dart';
import 'package:flutter_app_sanliurfa/view/login_screen.dart';
import 'package:flutter_app_sanliurfa/widget/responsive_button.dart';

class TanitimSayfasi extends StatefulWidget {
  const TanitimSayfasi({Key? key}) : super(key: key);

  @override
  _TanitimSayfasiState createState() => _TanitimSayfasiState();
}

class _TanitimSayfasiState extends State<TanitimSayfasi> {
  List resim = [
    "one.jpg",
    "two.jpg",
    "tree.jpg",
    "for.jpg",
    "five.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: resim.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/" + resim[index]),
                    fit: BoxFit.cover)),
            child: Container(
              margin: EdgeInsets.only(
                top: 150,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      butoon(elemanSayisi: resim.length, indexDegeri: index),
                      SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    children: List.generate(resim.length, (indexDots) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 5),
                        width: 10,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.4)),
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
          child: ResponsiveButton(width: 350));
    } else {
      return ResponsiveButton(width: 0);
    }
  }
}
