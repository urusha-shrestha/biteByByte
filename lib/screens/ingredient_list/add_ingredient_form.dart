import 'package:bitebybyte/constants/colors.dart';
import 'package:bitebybyte/screens/ingredient_list/custom_ingredient_data.dart';
import 'package:flutter/material.dart';

class AddIngredientForm extends StatefulWidget {
  const AddIngredientForm({super.key, required this.onAdd});

  final Function (String name, int count) onAdd;
  @override
  State<AddIngredientForm> createState() => _AddIngredientFormState();
}

class _AddIngredientFormState extends State<AddIngredientForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ingredientController = TextEditingController();
  int _count =1;


  void _submit(){
    final isValid = _formKey.currentState!.validate();
    if (isValid){
      widget.onAdd(ingredientController.text,_count);
      Navigator.of(context).pop(true);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
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
                  TextFormField(
                    controller: ingredientController,
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter an ingredient';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter an ingredient',
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Enter amount:  '),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if (_count > 1){
                              _count = _count-1;
                            }
                          });
                        },
                        child: Container(
                            height:30,
                            width: 30,
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: primaryColor),
                            ),
                            child: Center(child: Icon(Icons.remove, size: 10,color: primaryColor,))),
                      ),
                      const SizedBox(width: 5,),
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: Center(
                          child: Text('$_count', style: TextStyle(fontSize: 18),),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _count = _count + 1;
                          });
                        },
                        child: Container(
                            height:30,
                            width: 30,
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: primaryColor),
                            ),
                            child: Center(child: Icon(Icons.add, size: 10,color: primaryColor,))),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    child: const Text('Add'),
                    onPressed: () => _submit(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
