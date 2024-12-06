import 'package:bitebybyte/data/models/recommeded_items_model.dart';
import 'package:bitebybyte/screens/recipe_display/recipe_display.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class GridViewItem extends StatelessWidget {
  final RecommendedItemsModel recipe;
  final bool even;
  const GridViewItem({super.key, required this.recipe, this.even=true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> RecipeDisplay(recipe: recipe,))
          );
        },
        child: Container(
        
          height: 150,
          width: MediaQuery.of(context).size.width/2.4,
          
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color:neutralColor,blurRadius: 8,spreadRadius: 0.2, offset: const Offset(4,4))]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              even ? Container(
            height: 150, width: 90,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/recommended_3.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.centerRight),
        
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))
            ),
          ): Container(),
        
              SizedBox(
                  width: MediaQuery.of(context).size.width/1.8,
                  child: Text(recipe.title)),
              !even ? Container(
        height: 150, width: 90,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/recommended_1.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft),
        
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(70),
                      bottomLeft: Radius.circular(70))
                ),
              ): Container(),
            ],
          ),
        ),
      ),
    );
  }
}
