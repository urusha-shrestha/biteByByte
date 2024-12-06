import 'dart:convert';

import 'package:bitebybyte/constants/colors.dart';
import 'package:bitebybyte/data/models/recommeded_items_model.dart';
import 'package:bitebybyte/screens/recipe_display/widgets/torn_page_painter.dart';
import 'package:bitebybyte/screens/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class RecipeDisplay extends StatelessWidget {
  const RecipeDisplay({super.key,
  required this.recipe});
  final RecommendedItemsModel recipe;

  @override
  Widget build(BuildContext context) {
    List<String> steps = List<String>.from(json.decode(recipe.directions));
    List<String> ingredients = List<String>.from(json.decode(recipe.ingredients));

    bool useTwoColumns = ingredients.length > 4;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right:20.0,top: 70),
                      child: SizedBox(
              height: MediaQuery.of(context).size.height/1.2,
              child: CustomPaint(

              size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height/1.2), // Width and height of the paper
              painter: TornPaperPainter(),
                child: Padding(
                  padding: const EdgeInsets.only(top:14.0, right:14.0, left:14.0, bottom:80),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Center(child: Text(recipe.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 22, fontFamily: 'Charmonman'),)),
                              SizedBox(
                                height: 15,
                              ),
                              Text('Ingredients', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              // Display ingredients in one or two columns based on the count
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: ingredients.map((ingredient) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                                    child: Text(
                                      ingredient,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Directions', style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: steps.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                                    child: Text(
                                      '${index + 1}. ${steps[index]}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                  ),
                      ),
                    ),),
              CustomButton(fullWidth: true, back: true,)
            ],
          ),
    ));
  }
}


