
import 'dart:typed_data';


import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants/api_url.dart';
class ImageApi{
  Future<Uint8List> getDetectedImageApi(String imageId) async{
    var uri = Uri.parse('$getImageApi/$imageId');

    try{
      var response = await http.get(uri);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200){
        final data = response.bodyBytes;
        return data;
      } else{
        throw Exception('Failed to load image');
      }
    }catch(e){
      throw Exception('Error fetching image');
    }
  }
}