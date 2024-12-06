import 'package:bitebybyte/data/models/recommeded_items_model.dart';
import 'package:bitebybyte/data/provider/recommendation_api.dart';

class RecommendationService{
  final _api = RecommendationApi();

  Future<RecommendedItemsResponseModel?> getRecommendedItems(List<String> items) async{
    return _api.getRecommendedItems(items);
  }
}