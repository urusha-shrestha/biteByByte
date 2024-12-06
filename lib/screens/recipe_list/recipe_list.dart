import 'package:bitebybyte/data/models/recommeded_items_model.dart';
import 'package:bitebybyte/screens/recipe_list/custom_recipe_data.dart';
import 'package:bitebybyte/screens/recipe_list/widgets/grid_view_item.dart';
import 'package:bitebybyte/screens/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class RecipeList extends StatelessWidget {
  final RecommendedItemsResponseModel recipeList;
  const RecipeList({super.key, required this.recipeList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width:50,
                          child: Image.asset('assets/images/ingredients.png'),
                        ),
                        const SizedBox(width:10),

            const Text('Recipes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),


            ],
          )),
            Expanded(
              child: ListView.builder(
                  itemCount: recipeList.recommendations.length,
                  itemBuilder: (context, index){
                    return GridViewItem(recipe: recipeList.recommendations[index],even:index%2==0? true:false);
                  }),
            ),
              CustomButton(back:true, fullWidth: true,)
            ]
    ),),);
  }
}
