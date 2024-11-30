import 'package:bitebybyte/constants/colors.dart';
import 'package:bitebybyte/screens/home_page/widgets/abstract_shape.dart';
import 'package:bitebybyte/screens/home_page/widgets/take_picture_page.dart';
import 'package:bitebybyte/screens/loading_page/loading_page.dart';
import 'package:flutter/material.dart';
//import 'package:camera/camera.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  // final CameraDescription camera;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CustomPaint(
                  size: Size(MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height/1.6), // Adjust the size as needed
                  painter: AbstractShapePainter(),
                ),
                Image.asset('assets/images/chef.png', height:MediaQuery.sizeOf(context).height/2.5, width: MediaQuery.sizeOf(context).width/2,)
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('What time is it?', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                const Text("It's cooking time!",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                const SizedBox(
                    height:50
                ),
                Text('Snap a picture of your ingredients to discover delicious recipe ideas tailored just for you!',
                textAlign: TextAlign.center, style: TextStyle(color: neutralColor),)
              ],
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoadingPage(recommending: true)));
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
