import 'dart:convert';

class DetectedItemsResponseModel{
  DetectedItemsResponseModel({required this.imageUuid, required this.items});

  final String imageUuid;
  final List<DetectedItemsModel> items;

  factory DetectedItemsResponseModel.fromJson(Map<String,dynamic> json){
    return DetectedItemsResponseModel(
        imageUuid: json['image_uuid'] as String,
      items:(json['items'] as List<dynamic>)
        .map((item) => DetectedItemsModel.fromJson(item as Map<String,dynamic>))
        .toList()
    );
  }
}

DetectedItemsResponseModel detectedItemsFromJson(String str){
  final jsonData = json.decode(str);
  return DetectedItemsResponseModel.fromJson(jsonData);
}


class DetectedItemsModel{
  DetectedItemsModel({required this.name, required this.count});
  String name;
  int count;

  factory DetectedItemsModel.fromJson(Map<String,dynamic> json){
    return DetectedItemsModel(
        name: json['name'] as String,
        count: json['count'] as int);
  }
}