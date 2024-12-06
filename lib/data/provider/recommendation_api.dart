import 'dart:convert';

import 'package:bitebybyte/constants/api_url.dart';
import 'package:bitebybyte/data/models/recommeded_items_model.dart';
import 'package:http/http.dart' as http;

class RecommendationApi{
  Future<RecommendedItemsResponseModel?> getRecommendedItems(List<String> items) async{
    var client = http.Client();
    var uri = Uri.parse(getRecommendationApi);

    Map<String,dynamic> requestBody={
      'items':items
    };

    try{
      var response =await http.post(uri,
          headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody));
      if(response.statusCode == 200){
        return recommendedItemsFromJson(response.body);
      }
    } catch(e){
      print('Error during api call $e');
    } finally{
      client.close();
    }

    return null;
  }
}