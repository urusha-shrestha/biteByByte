import 'dart:io';
import 'package:flutter/material.dart';

import '../../../data/service/detection_service.dart';
import '../../ingredient_list/ingredient_list.dart';
import '../../loading_page/loading_page.dart';
import '../../widgets/custom_button_widget.dart';

class DisplayPicturePage extends StatefulWidget {
  const DisplayPicturePage({super.key, required this.image});
  final File? image;

  @override
  State<DisplayPicturePage> createState() => _DisplayPicturePageState();
}

class _DisplayPicturePageState extends State<DisplayPicturePage> {
  bool _isLoading = false;

  // Function to call the detection API
  Future<void> _detectItems() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final detectionService = DetectionService();
      var detectedItems = await detectionService.getDetectedItems(widget.image!);

      setState(() {
        _isLoading = false;
      });

      if (detectedItems != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IngredientList(ingredientList:detectedItems.items,
            imageId: detectedItems.imageUuid,),
          ),
        );
      } else {
        _showErrorDialog('Failed to fetch detected items.');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog('An error occurred: ${e.toString()}');
    }
  }

  // Function to show an error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    if(_isLoading){
      return const LoadingPage(recommending: false,);
    }
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top:100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.file(
                widget.image!,
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(back: true,),
                  CustomButton(customFunc: true,
                    onTap: (){
                     _detectItems();

                    },)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
