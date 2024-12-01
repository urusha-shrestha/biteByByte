import 'package:bitebybyte/constants/colors.dart';
import 'package:bitebybyte/screens/ingredient_list/add_ingredient_form.dart';
import 'package:bitebybyte/screens/ingredient_list/custom_ingredient_data.dart';
import 'package:bitebybyte/screens/ingredient_list/widgets/list_view_item.dart';
import 'package:bitebybyte/screens/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

import '../loading_page/loading_page.dart';

class IngredientList extends StatelessWidget {
  final List<IngredientListClass> ingredientList;
  const IngredientList({super.key, required this.ingredientList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Items detected', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          Text('${ingredientList.length} items', style: TextStyle(color: neutralColor),)
                        ],
                      ),
                    ],
                  ),

                  GestureDetector(
                      onTap:(){
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return AddIngredientForm();
                          },
                        );
                      },
                      child: const Text('Add + ', style: TextStyle(fontSize: 18),))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: ingredientList.length,
                  itemBuilder: (context, index){
                    return ListViewItem(name: ingredientList[index].ingredientName,count:ingredientList[index].count);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(back: true,),
                CustomButton(loading: true,)
              ],
            )
          ],
        ),
      ),
    );
  }
}




