// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

class SearchParameters {
  Categories categories;
  Purity purity;
  Sorting sorting;
  Order order;
  String topRange;
  String resolutions;
  String ratios;
  String colors;
  int page;
  String seed;
  SearchParameters({
    required this.categories,
    required this.purity,
    required this.sorting,
    required this.order,
    required this.topRange,
    required this.resolutions,
    required this.ratios,
    required this.colors,
    required this.page,
    required this.seed,
  });

  factory SearchParameters.defaultValues() => SearchParameters(
        categories: Categories(
          general: true,
          anime: true,
          people: true,
        ),
        purity: Purity(
          sfw: true,
          sketchy: false,
          nsfw: false,
        ),
        sorting: Sorting.toplist,
        order: Order.desc,
        topRange: "1M",
        resolutions: "",
        ratios: "",
        colors: "",
        page: 1,
        seed: "",
      );

  Map<String, dynamic> toQueryParameters() {
    Map<String, dynamic> result = {};
    result["categories"] = categories.toString();
    result["purity"] = purity.toString();
    result["sorting"] = enumValueToString(sorting);
    result["order"] = enumValueToString(order);
    result["page"] = page;

    if (sorting == Sorting.toplist) result["topRange"] = topRange;
    if (resolutions != "") result["resolutions"] = resolutions;
    if (ratios != "") result["ratios"] = ratios;
    if (colors != "") result["colors"] = colors;
    if (seed != "") result["seed"] = seed;
    debugPrint("query parameters: " + result.toString());
    return result;
  }

  SearchParameters copyWith({
    Categories? categories,
    Purity? purity,
    Sorting? sorting,
    Order? order,
    String? topRange,
    String? resolutions,
    String? ratios,
    String? colors,
    int? page,
    String? seed,
  }) {
    return SearchParameters(
      categories: categories ?? this.categories,
      purity: purity ?? this.purity,
      sorting: sorting ?? this.sorting,
      order: order ?? this.order,
      topRange: topRange ?? this.topRange,
      resolutions: resolutions ?? this.resolutions,
      ratios: ratios ?? this.ratios,
      colors: colors ?? this.colors,
      page: page ?? this.page,
      seed: seed ?? this.seed,
    );
  }
}

String enumValueToString(Enum value) => value.toString().split('.').last;

class Categories {
  bool general;
  bool anime;
  bool people;
  Categories({
    required this.general,
    required this.anime,
    required this.people,
  });

  @override
  String toString() {
    return "${general ? 1 : 0}${anime ? 1 : 0}${people ? 1 : 0}";
  }
}

class Purity {
  bool sfw;
  bool sketchy;
  bool nsfw;
  Purity({
    required this.sfw,
    required this.sketchy,
    required this.nsfw,
  });

  @override
  String toString() {
    return "${sfw ? 1 : 0}${sketchy ? 1 : 0}${nsfw ? 1 : 0}";
  }
}

enum Sorting {
  date_added,
  relevance,
  random,
  views,
  favorites,
  toplist,
}

enum Order {
  desc,
  asc,
}
