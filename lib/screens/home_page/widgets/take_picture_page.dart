// import 'dart:io';
//
// import 'package:flutter/material.dart';
// //import 'package:camera/camera.dart';
//
// class TakePicturePage extends StatefulWidget {
//   const TakePicturePage({super.key});
//   //final CameraDescription camera;
//
//   @override
//   State<TakePicturePage> createState() => _TakePicturePageState();
// }
//
// class _TakePicturePageState extends State<TakePicturePage> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(
//       widget.camera,
//       ResolutionPreset.medium
//     );
//     _initializeControllerFuture = _controller.initialize();
//
//   }
//
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Take a picture')),
//       body: FutureBuilder<void>(
//           future: _initializeControllerFuture,
//           builder: (context, snapshot){
//             if(snapshot.connectionState ==ConnectionState.done){
//               return CameraPreview(_controller);
//             } else{
//               return const Center(child: CircularProgressIndicator());
//             }
//           }),
//       floatingActionButton: FloatingActionButton(
//           onPressed: () async{
//             try{
//               await _initializeControllerFuture;
//               final image = await _controller.takePicture();
//               if (!context.mounted) return;
//
//               await Navigator.of(context).push(
//                 MaterialPageRoute(
//                     builder: (context)=> DisplayPictureScreen(imagePath: image.path,))
//               );
//             } catch(e){
//               print(e);
//             }
//           }, child: const Icon(Icons.camera_alt),),
//     );
//   }
// }
//
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;
//
//   const DisplayPictureScreen({super.key, required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the Picture')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image.
//       body: Image.file(File(imagePath)),
//     );
//   }
// }