class ListStyleCategory {
  int? records;
  bool? status;
  String? message;
  List<StyleCategories>? styleCategories;

  ListStyleCategory(
      {this.records, this.status, this.message, this.styleCategories});

  ListStyleCategory.fromJson(Map<String, dynamic> json) {
    records = json['Records'];
    status = json['Status'];
    message = json['Message'];
    if (json['StyleCategories'] != null) {
      styleCategories = <StyleCategories>[];
      json['StyleCategories'].forEach((v) {
        styleCategories!.add(StyleCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Records'] = records;
    data['Status'] = status;
    data['Message'] = message;
    if (styleCategories != null) {
      data['StyleCategories'] =
          styleCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StyleCategories {
  String? styleCategoryID;
  String? styleCategoryName;

  StyleCategories({this.styleCategoryID, this.styleCategoryName});

  StyleCategories.fromJson(Map<String, dynamic> json) {
    styleCategoryID = json['StyleCategoryID'];
    styleCategoryName = json['StyleCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StyleCategoryID'] = styleCategoryID;
    data['StyleCategoryName'] = styleCategoryName;
    return data;
  }
}