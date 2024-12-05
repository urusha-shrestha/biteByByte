import 'dart:io';

import 'package:bitebybyte/constants/colors.dart';
import 'package:bitebybyte/screens/home_page/widgets/abstract_shape.dart';
import 'package:bitebybyte/screens/home_page/widgets/display_picture_page.dart';
import 'package:bitebybyte/screens/ingredient_list/custom_ingredient_data.dart';
import 'package:bitebybyte/screens/ingredient_list/ingredient_list.dart';
import 'package:bitebybyte/screens/loading_page/loading_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  File? _image;
  final picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if(pickedFile != null){
        _image = File(pickedFile.path);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DisplayPicturePage(image: _image,)));
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async{
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if(pickedFile != null){
        _image = File(pickedFile.path);
        //TODO: implement object detection API
        
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IngredientList(ingredientList: ingredientList)));
      }
    });
  }

  //Show options to get image from camera or gallery
  Future showOptions() async{
    showCupertinoModalPopup(
        context: context,
        builder: (context)=> CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed: (){
                  //close the options modal
                  Navigator.of(context).pop();
                  //get image from gallery
                  getImageFromGallery();
            }, child: Text('Gallery')),
           CupertinoActionSheetAction(
               onPressed: (){
                 //close the options modal
                 Navigator.of(context).pop();
                 //get image from camera
                 getImageFromCamera();
               }, 
               child: Text('Camera')) 
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CustomPaint(
                  size: Size(MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height/1.6), // Adjust the size as needed
                  painter: AbstractShapePainter(),
                ),
                //_image == null ? Text('No Image') : Image.file(_image!)
                Image.asset('assets/images/chef.png', height:MediaQuery.sizeOf(context).height/2.5, width: MediaQuery.sizeOf(context).width/2,)
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('What time is it?', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                const Text("It's cooking time!",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                const SizedBox(
                    height:40
                ),
                Text('Snap a picture of your ingredients to discover delicious recipe ideas tailored just for you!',
                textAlign: TextAlign.center, style: TextStyle(color: neutralColor),)
              ],
            ),

            GestureDetector(
              onTap: () {
               // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoadingPage(recommending: true)));
              //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IngredientList(ingredientList: ingredientList)));
              showOptions();
              },
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor
                ),
                child: Icon(Icons.camera_alt_outlined, size: 50,color: accentColor,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
