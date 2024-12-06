import 'dart:io';

import 'package:bitebybyte/data/models/detected_items_model.dart';
import 'package:bitebybyte/data/provider/detection_api.dart';

class DetectionService{
  final _api = DetectionApi();

  Future<DetectedItemsResponseModel?> getDetectedItems(File imageFile) async{
    return _api.getDetectedItems(imageFile);
  }
}