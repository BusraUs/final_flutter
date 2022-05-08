import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_sanliurfa/core/colors.dart';
import 'package:flutter_app_sanliurfa/widget/app_baslik_text.dart';
import 'package:flutter_app_sanliurfa/widget/app_icerik_text.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  List taramaResim = [
    "tarama-1.jpg",
  ];
  List hastalikResim = [
    "hastalik-1.jpg",
    "hastalik-2.jpg",
    "hastalik-3.jpg",
    "hastalik-4.jpg",
    "hastalik-5.jpg",
  ];

  List kategoriler = [
    "hastalik-1.jpg",
    "hastalik-2.jpg",
    "hastalik-3.jpg",
    "hastalik-2.jpg",
    "hastalik-3.jpg",
  ];

  List kategorIsme = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbarIcon(),
          SizedBox(height: 20),
          baslik(),
          SizedBox(height: 10),
          //tabbarbaslik(tabController: _tabController),
          Center(
            child: GestureDetector(
              onTap: () async {
                final file = await ImagePicker.platform
                    .getImage(source: ImageSource.camera);

                print(file?.path);

                setState(() {
                  selectedImage = file?.path != null ? File(file!.path) : null;
                });
              },
              child: Container(
                height: 350,
                width: double.infinity,
                child: Column(
                  children: [
                    if (selectedImage == null)
                      Center(
                        child: Image.asset(
                          "assets/images/tarama-1.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (selectedImage != null)
                      Image.file(
                        selectedImage!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 250,
                      ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          /* Container(
            padding: EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                tabbarViewDetay(disardanGelenListe: taramaResim),
                tabbarViewDetay(disardanGelenListe: hastalikResim),
              ],
            ),
          ),*/
          SizedBox(height: 30),
          kategoriBaslik(),
          SizedBox(height: 10),
          katerigoriIcerik(kategoriler: kategoriler, kategorIsme: kategorIsme),
        ],
      ),
    );
  }
}

class katerigoriIcerik extends StatelessWidget {
  const katerigoriIcerik({
    Key? key,
    required this.kategoriler,
    required this.kategorIsme,
  }) : super(key: key);

  final List kategoriler;
  final List kategorIsme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 20),
      child: ListView.builder(
          itemCount: kategoriler.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.only(right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kategoriIcerikDetay(
                    kategoriler: kategoriler,
                    index: index,
                  ),
                  SizedBox(height: 5),
                  kategoriAltBaslik(
                    kategorIsme: kategorIsme,
                    index: index,
                  )
                ],
              ),
            );
          }),
    );
  }
}

class kategoriAltBaslik extends StatelessWidget {
  const kategoriAltBaslik({
    Key? key,
    required this.kategorIsme,
    required this.index,
  }) : super(key: key);

  final List kategorIsme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ApppIcerikText(
        text: kategorIsme[index],
        size: 12,
        renk: AppColors.textColor2,
      ),
    );
  }
}

class kategoriIcerikDetay extends StatelessWidget {
  const kategoriIcerikDetay({
    Key? key,
    required this.kategoriler,
    required this.index,
  }) : super(key: key);

  final List kategoriler;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/" + kategoriler[index]),
              fit: BoxFit.cover),
        ));
  }
}

class kategoriBaslik extends StatelessWidget {
  const kategoriBaslik({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBaslikText(text: "Önceki sonuçlar", size: 20),
          ApppIcerikText(
            text: "Hepsini Göster",
            size: 13,
            renk: AppColors.textColor2,
          )
        ],
      ),
    );
  }
}

class tabbarViewDetay extends StatelessWidget {
  const tabbarViewDetay({
    Key? key,
    required this.disardanGelenListe,
  }) : super(key: key);

  final List disardanGelenListe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: disardanGelenListe.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(right: 30),
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/" + disardanGelenListe[index]),
                    fit: BoxFit.cover,
                  )),
            );
          }),
    );
  }
}

class tabbarbaslik extends StatelessWidget {
  const tabbarbaslik({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Align(
        alignment: Alignment.center,
        child: TabBar(
            labelPadding: EdgeInsets.only(left: 20, right: 20),
            controller: _tabController,
            labelColor: AppColors.mainColor,
            unselectedLabelColor: Colors.grey.withOpacity(0.5),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(icon: Icon(Icons.dashboard_customize_sharp)),
              Tab(icon: Icon(Icons.local_hospital_rounded)),
            ]),
      ),
    );
  }
}

class baslik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Center(
        child: AppBaslikText(
          text: "BUWED APP",
        ),
      ),
    );
  }
}

class appbarIcon extends StatelessWidget {
  const appbarIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: Colors.black54),
          Icon(Icons.access_alarm),
        ],
      ),
    );
  }
}
