

import 'package:provider_demo/util/url_resources.dart';

class Utils{
  static String getFullUrl({required endPoint}){
    return "${UrlResources.baseImageUrl}$endPoint";
  }
  static String getNextPage({required index}){
    return "${UrlResources.baseApiUrl}$index";
}
  // String ddd= Utils.getFullUrl(endPoint: "fff/g.png");
}