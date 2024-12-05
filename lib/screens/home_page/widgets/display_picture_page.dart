import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPicturePage extends StatelessWidget {
  const DisplayPicturePage({super.key, required this.image});
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.file(image!),
      ),
    );
  }
}
