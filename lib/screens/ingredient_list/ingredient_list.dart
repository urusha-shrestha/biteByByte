
import 'package:bitebybyte/constants/colors.dart';
import 'package:bitebybyte/data/models/detected_items_model.dart';
import 'package:bitebybyte/data/service/image_service.dart';
import 'package:bitebybyte/data/service/recommendation_service.dart';
import 'package:bitebybyte/screens/ingredient_list/add_ingredient_form.dart';
import 'package:bitebybyte/screens/ingredient_list/widgets/list_view_item.dart';
import 'package:bitebybyte/screens/recipe_list/recipe_list.dart';
import 'package:bitebybyte/screens/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import '../loading_page/loading_page.dart';
import 'dart:typed_data';

class IngredientList extends StatefulWidget {
  final String imageId;
  final List<DetectedItemsModel> ingredientList;
  const IngredientList({super.key, required this.ingredientList, required this.imageId});

  @override
  State<IngredientList> createState() => _IngredientListState();
}

class _IngredientListState extends State<IngredientList> {

  bool _isLoading = false;


  //function to add new item form the bottom modal
  void _addNewItem(String name, int count){
    setState(() {
      widget.ingredientList.add(DetectedItemsModel(name: name, count: count));
    });
  }

  //function to increment count
  void _incrementCount(int index){
    setState(() {
      widget.ingredientList[index].count++;
    });
  }

  //function to decrement count
  void _decrementCount(int index){
    setState(() {
      if (widget.ingredientList[index].count>1){
        widget.ingredientList[index].count--;
      }
    });
  }

  //function to delete an item
  void _deleteItem(int index){
    setState(() {
      widget.ingredientList.removeAt(index);
    });
  }



  void _recommendItems(List<String> items) async{
    setState(() {
      _isLoading = true;
    });

    RecommendationService recommendationService = RecommendationService();
    var recommendedItems = await recommendationService.getRecommendedItems(items);

    setState(() {
      _isLoading =false;
    });

    if(recommendedItems != null){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> RecipeList(recipeList: recommendedItems))
      );
    }
    else{
      showDialog(
      context: context,
      builder: (context)=> AlertDialog(
      title:const Text('Error'),
      content: const Text('Failed to fetch detected items'),
      actions:[TextButton(
      onPressed: () => Navigator.pop(context),
      child: const Text('OK')
    )
    ]
    )
    );
    }
    }

    void showImageDialog(BuildContext context,Uint8List imageData){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return Dialog(
              insetPadding: EdgeInsets.only(top:40, left:16, right:16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.memory(imageData,
                fit: BoxFit.cover,)
              ),
            );
          });
    }

  @override
  Widget build(BuildContext context) {
    if(_isLoading){
      return const LoadingPage(recommending: true,);
    }
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
                          Text('${widget.ingredientList.length} items', style: TextStyle(color: neutralColor),)
                        ],
                      ),
                    ],
                  ),

                  GestureDetector(
                      onTap:(){
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return AddIngredientForm(onAdd: _addNewItem,);
                          },
                        );
                      },
                      child: const Text('Add + ', style: TextStyle(fontSize: 18),))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.ingredientList.length,
                  itemBuilder: (context, index){
                    return ListViewItem(
                      name: widget.ingredientList[index].name,
                      count:widget.ingredientList[index].count,
                      index: index,
                      onIncrement: _incrementCount,
                      onDecrement: _decrementCount,
                      onDelete: _deleteItem
                    );
                  }),
            ),
            FloatingActionButton(
                shape: CircleBorder(),
                onPressed: ()async{
                  try{
                    ImageService imageService = ImageService();
                    Uint8List imageData = await imageService.getDetectedImage(widget.imageId);
                    showImageDialog(context, imageData);
                  } catch(e){
                    showDialog(
                      context:context,
                      builder:(BuildContext  context){
                        return AlertDialog(
                          title: Text('Error'),
                          actions:[
                            TextButton(
                              onPressed: ()=> Navigator.of(context).pop(),
                              child: Text('OK'),
                            )
                          ]
                        );
                      }
                    );
                  }
                },
            child: Icon(Icons.image),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(back: true,),
                CustomButton(customFunc: true,
                    onTap: (){
                      List<String> namesList = widget.ingredientList.map((item) => item.name).toList();
                      if(namesList.isNotEmpty){
                        _recommendItems(namesList);
                      }

                    },)
              ],
            )
          ],
        ),
      ),
    );
  }
}




