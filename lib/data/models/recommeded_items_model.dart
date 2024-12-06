import 'dart:convert';

class RecommendedItemsResponseModel{
  RecommendedItemsResponseModel({required this.recommendations});
  final List<RecommendedItemsModel> recommendations;

  factory RecommendedItemsResponseModel.fromJson(Map<String,dynamic> json){
    return RecommendedItemsResponseModel(
        recommendations: (json['recommendations'] as List<dynamic>)
          .map((item)=>RecommendedItemsModel.fromJson(item as Map<String,dynamic>))
           .toList());
  }
}

RecommendedItemsResponseModel recommendedItemsFromJson(String str){
  final jsonData = json.decode(str);
  return RecommendedItemsResponseModel.fromJson(jsonData);
}

class RecommendedItemsModel{
  RecommendedItemsModel({
    required this.title,
    required this.ingredients,
    required this.directions
});
  final String title;
  final String ingredients;
  final String directions;

  factory RecommendedItemsModel.fromJson(Map<String,dynamic> json){
    return RecommendedItemsModel(
        title: json['title'],
        ingredients: json['ingredients'],
        directions: json['directions']);
  }
}