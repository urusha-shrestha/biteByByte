import 'dart:convert';
import 'dart:io';
import 'package:bitebybyte/constants/api_url.dart';
import 'package:http/http.dart' as http;
import '../models/detected_items_model.dart';

class DetectionApi{
  Future<DetectedItemsResponseModel?> getDetectedItems(File imageFile) async{
    var client = http.Client();
    var uri = Uri.parse(getDetectionApi);

    try{
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath(
        'file', imageFile.path
      ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200){
        return detectedItemsFromJson(Utf8Decoder().convert(response.bodyBytes));
      }
    } catch(e){
      print('Error during api call $e');
    } finally{
      client.close();
    }

    return null;
  }
}