import 'package:bitebybyte/screens/ingredient_list/custom_ingredient_data.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class ListViewItem extends StatelessWidget {
  final String name;
  final int count;
  final int index;
  final Function(int) onIncrement;
  final Function(int) onDecrement;
  final Function(int) onDelete;
  const ListViewItem({
    required this.name, required this.count,
    required this.index,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(name),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        onDelete(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$name deleted')),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color:neutralColor,blurRadius: 3,spreadRadius: 0.2, offset: const Offset(3,3))]
          ),
          height: 80,
          padding: const EdgeInsets.only(left: 8),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50,width:50,
                    child: Image.asset('assets/images/items.png'),
                  ),
                  const SizedBox(width:10),
                  Text(name, style: const TextStyle(fontSize: 18),),
                ],
              ),

              SizedBox(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:()=> onDecrement(index),
                      child: Container(
                          height:25,
                          width: 25,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: primaryColor),
                          ),
                          child: Center(child: Icon(Icons.remove, size: 10,color: primaryColor,))),
                    ),
                    const SizedBox(width: 5,),
                    Text('$count',style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: ()=>onIncrement(index),
                      child: Container(
                          height:25,
                          width: 25,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: primaryColor),
                          ),
                          child: Center(child: Icon(Icons.add, size: 10,color: primaryColor,))),
                    ),
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
      ),
    );
  }
}