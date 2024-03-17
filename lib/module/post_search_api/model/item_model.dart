
import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  QueryStatistics? queryStatistics;
  int? totalPages;
  int? currentPageIndex;
  int? totalRecords;
  int? returnedRecords;
  List<Item>? items;

  Search({
    this.queryStatistics,
    this.totalPages,
    this.currentPageIndex,
    this.totalRecords,
    this.returnedRecords,
    this.items,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    queryStatistics: json["queryStatistics"] == null ? null : QueryStatistics.fromJson(json["queryStatistics"]),
    totalPages: json["totalPages"],
    currentPageIndex: json["currentPageIndex"],
    totalRecords: json["totalRecords"],
    returnedRecords: json["returnedRecords"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );


  Map<String, dynamic> toJson() => {
    "queryStatistics": queryStatistics?.toJson(),
    "totalPages": totalPages,
    "currentPageIndex": currentPageIndex,
    "totalRecords": totalRecords,
    "returnedRecords": returnedRecords,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  String? title;
  bool? isTrusted;
  int? type;
  String? description;
  String? thumbnailUrl;
  String? entityId;
  dynamic referenceCount;

  Item({
    this.title,
    this.isTrusted,
    this.type,
    this.description,
    this.thumbnailUrl,
    this.entityId,
    this.referenceCount,
  });


  factory Item.fromJson(Map<String, dynamic> json) => Item(
    title: json["title"],
    isTrusted: json["isTrusted"],
    type: json["type"],
    description: json["description"],
    thumbnailUrl: json["thumbnailUrl"] ,
    entityId: json["entityId"],
    referenceCount: json["referenceCount"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "isTrusted": isTrusted,
    "type": type,
    "description": description,
    "thumbnailUrl": thumbnailUrl,
    "entityId": entityId,
    "referenceCount": referenceCount,
  };
}

class QueryStatistics {
  QueryStatistics();

  factory QueryStatistics.fromJson(Map<String, dynamic> json) => QueryStatistics(
  );

  Map<String, dynamic> toJson() => {
  };
}
