import 'package:bitebybyte/data/provider/image_api.dart';
import 'dart:typed_data';

class ImageService{
  final _api = ImageApi();

  Future<Uint8List> getDetectedImage(String imageId)async{
    return _api.getDetectedImageApi(imageId);
  }
}