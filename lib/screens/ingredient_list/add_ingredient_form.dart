import 'package:bitebybyte/constants/colors.dart';
import 'package:flutter/material.dart';

class AddIngredientForm extends StatelessWidget {
  const AddIngredientForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter an ingredient',
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Text('Enter amount:  '),
                    Container(
                        height:30,
                        width: 30,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: primaryColor),
                        ),
                        child: Center(child: Icon(Icons.remove, size: 10,color: primaryColor,))),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: TextField(decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                        height:30,
                        width: 30,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: primaryColor),
                        ),
                        child: Center(child: Icon(Icons.add, size: 10,color: primaryColor,))),
                  ],
                ),
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
