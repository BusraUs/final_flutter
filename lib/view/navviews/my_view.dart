import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyView extends StatefulWidget {
  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final file =
                await ImagePicker.platform.getImage(source: ImageSource.camera);

            print(file?.path);

            setState(() {
              selectedImage = file?.path != null ? File(file!.path) : null;
            });
          },
          child: const Icon(Icons.camera),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'PROFİL SAYFASI',
                style: TextStyle(fontSize: 35),
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
        ));
  }
}
