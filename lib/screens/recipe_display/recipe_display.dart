import 'package:bitebybyte/constants/colors.dart';
import 'package:bitebybyte/screens/recipe_display/widgets/torn_page_painter.dart';
import 'package:flutter/material.dart';

class RecipeDisplay extends StatelessWidget {
  const RecipeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children:[ SizedBox(
            height: MediaQuery.of(context).size.height/1.2,
            child: CustomPaint(

            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height/1.2), // Width and height of the paper
            painter: TornPaperPainter(),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ingredients'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [Text('Row 1'), Text('Row 2')],)
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Directions'),
                            Text('ajs')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
                ),
          ),
            Positioned(
                top:-20,
                child: Text('Recipe', style: TextStyle(fontSize: 24),)),

          ]
        ),
      ),),
    ));
  }
}


