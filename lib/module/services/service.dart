

import 'package:provider_demo/module/post_search_api/model/item_model.dart';
import 'package:provider_demo/util/helper/api_handler.dart';
import 'package:provider_demo/util/url_resources.dart';

class SearchService {
  static Future<Search> searchService({required int pageIndex, required String searchText,}) async {
    try {
      final result = await ApiHandler.postRequest(UrlResources.searchApiUrl,
          headers: {"Accept": "application/json", "content-type": "application/json"},
          body: {"pageIndex": pageIndex, "searchText": searchText, "returnedRecords": 20});
      return Search.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }
}
