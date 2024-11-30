import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bitebybyte/constants/colors.dart';
import 'package:bitebybyte/constants/images.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key, required this.recommending});
  final bool recommending;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                recommending?
                recommendLoadingGif : detectionLoadingGif, height: 150,width:150,),
              AnimatedTextKit(
                repeatForever: true,
                  animatedTexts: recommending? [TyperAnimatedText('Exploring the cookbook of possibilities.', textStyle:TextStyle(fontSize: 15, color: primaryColor),
              speed: Duration(milliseconds: 40)),
                    TyperAnimatedText('Just a sec, sauteing some ideas for you.', textStyle:TextStyle(fontSize: 15, color: primaryColor),
                        speed: Duration(milliseconds: 40)),
                    TyperAnimatedText('Almost ready! The recipe fairy is working overtime.', textStyle:TextStyle(fontSize: 15, color: primaryColor),
                        speed: Duration(milliseconds: 40))]:
                  [TyperAnimatedText('Hmm.. Is that an apple or a tomato?', textStyle:TextStyle(fontSize: 15, color: primaryColor),
                      speed: Duration(milliseconds: 40)),
                    TyperAnimatedText('Hang tight! Finding your ingredients. ', textStyle:TextStyle(fontSize: 15, color: primaryColor),
                        speed: Duration(milliseconds: 40)),
                    TyperAnimatedText('Zooming in... Is that a banana I see? ', textStyle:TextStyle(fontSize: 15, color: primaryColor),
                        speed: Duration(milliseconds: 40))])
            ],
          ),
        ),
      ),
    );
  }
}
