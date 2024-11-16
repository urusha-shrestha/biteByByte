import 'package:bitebybyte/constants/colors.dart';
import 'package:bitebybyte/screens/ingredient_list/custom_data.dart';
import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Items detected', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Text('${ingredientList.length} items', style: TextStyle(color: neutralColor),)
                    ],
                  ),
                  GestureDetector(
                      onTap:(){},
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
            Container(
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              color: primaryColor,
              child: Icon(Icons.arrow_forward_sharp, size:30, color: backgroundColor),
            )
          ],
        ),
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  final String name;
  final int count;
  const ListViewItem({
    required this.name, required this.count,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color:neutralColor,blurRadius: 5,spreadRadius: 0.5, offset: const Offset(3,3))]
        ),
        height: 80,
        padding: const EdgeInsets.only(left: 15),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(fontSize: 18),),
             SizedBox(
                child: Row(
                  children: [
                    Container(
                      height:20,
                        width: 20,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: primaryColor),
                        ),
                        child: Center(child: Icon(Icons.remove, size: 10,color: primaryColor,))),
                    const SizedBox(width: 5,),
                    Text('$count',style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 5,),
                    Container(
                        height:20,
                        width: 20,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: primaryColor),
                        ),
                        child: Center(child: Icon(Icons.add, size: 10,color: primaryColor,))),
                    const SizedBox(width: 15,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                        color: primaryColor,
                      ),
                      width: 14,
                      height: 100,
                      child: Icon(Icons.delete_outline, color: backgroundColor, size: 12,),
                    )
                  ],
                ),),


          ],
        ),
      ),
    );
  }
}
