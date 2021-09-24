// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

// generated from wallhaven api json
class WallhavenImage {
  final String id;
  final String url;
  final String short_url;
  final int views;
  final int favorites;
  final String source;
  final String purity;
  final String category;
  final int dimension_x;
  final int dimension_y;
  final String resolution;
  final String ratio;
  final int file_size;
  final String file_type;
  final String created_at;
  final List<String> colors;
  final String path;
  final Thumbs thumbs;
  WallhavenImage({
    required this.id,
    required this.url,
    required this.short_url,
    required this.views,
    required this.favorites,
    required this.source,
    required this.purity,
    required this.category,
    required this.dimension_x,
    required this.dimension_y,
    required this.resolution,
    required this.ratio,
    required this.file_size,
    required this.file_type,
    required this.created_at,
    required this.colors,
    required this.path,
    required this.thumbs,
  });

  WallhavenImage copyWith({
    String? id,
    String? url,
    String? short_url,
    int? views,
    int? favorites,
    String? source,
    String? purity,
    String? category,
    int? dimension_x,
    int? dimension_y,
    String? resolution,
    String? ratio,
    int? file_size,
    String? file_type,
    String? created_at,
    List<String>? colors,
    String? path,
    Thumbs? thumbs,
  }) {
    return WallhavenImage(
      id: id ?? this.id,
      url: url ?? this.url,
      short_url: short_url ?? this.short_url,
      views: views ?? this.views,
      favorites: favorites ?? this.favorites,
      source: source ?? this.source,
      purity: purity ?? this.purity,
      category: category ?? this.category,
      dimension_x: dimension_x ?? this.dimension_x,
      dimension_y: dimension_y ?? this.dimension_y,
      resolution: resolution ?? this.resolution,
      ratio: ratio ?? this.ratio,
      file_size: file_size ?? this.file_size,
      file_type: file_type ?? this.file_type,
      created_at: created_at ?? this.created_at,
      colors: colors ?? this.colors,
      path: path ?? this.path,
      thumbs: thumbs ?? this.thumbs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'short_url': short_url,
      'views': views,
      'favorites': favorites,
      'source': source,
      'purity': purity,
      'category': category,
      'dimension_x': dimension_x,
      'dimension_y': dimension_y,
      'resolution': resolution,
      'ratio': ratio,
      'file_size': file_size,
      'file_type': file_type,
      'created_at': created_at,
      'colors': colors,
      'path': path,
      'thumbs': thumbs.toMap(),
    };
  }

  factory WallhavenImage.fromMap(Map<String, dynamic> map) {
    return WallhavenImage(
      id: map['id'],
      url: map['url'],
      short_url: map['short_url'],
      views: map['views']?.toInt(),
      favorites: map['favorites']?.toInt(),
      source: map['source'],
      purity: map['purity'],
      category: map['category'],
      dimension_x: map['dimension_x']?.toInt(),
      dimension_y: map['dimension_y']?.toInt(),
      resolution: map['resolution'],
      ratio: map['ratio'],
      file_size: map['file_size']?.toInt(),
      file_type: map['file_type'],
      created_at: map['created_at'],
      colors: List<String>.from(map['colors']),
      path: map['path'],
      thumbs: Thumbs.fromMap(map['thumbs']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WallhavenImage.fromJson(String source) =>
      WallhavenImage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Image(id: $id, url: $url, short_url: $short_url, views: $views, favorites: $favorites, source: $source, purity: $purity, category: $category, dimension_x: $dimension_x, dimension_y: $dimension_y, resolution: $resolution, ratio: $ratio, file_size: $file_size, file_type: $file_type, created_at: $created_at, colors: $colors, path: $path, thumbs: $thumbs)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WallhavenImage &&
        other.id == id &&
        other.url == url &&
        other.short_url == short_url &&
        other.views == views &&
        other.favorites == favorites &&
        other.source == source &&
        other.purity == purity &&
        other.category == category &&
        other.dimension_x == dimension_x &&
        other.dimension_y == dimension_y &&
        other.resolution == resolution &&
        other.ratio == ratio &&
        other.file_size == file_size &&
        other.file_type == file_type &&
        other.created_at == created_at &&
        listEquals(other.colors, colors) &&
        other.path == path &&
        other.thumbs == thumbs;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        url.hashCode ^
        short_url.hashCode ^
        views.hashCode ^
        favorites.hashCode ^
        source.hashCode ^
        purity.hashCode ^
        category.hashCode ^
        dimension_x.hashCode ^
        dimension_y.hashCode ^
        resolution.hashCode ^
        ratio.hashCode ^
        file_size.hashCode ^
        file_type.hashCode ^
        created_at.hashCode ^
        colors.hashCode ^
        path.hashCode ^
        thumbs.hashCode;
  }
}

class Thumbs {
  final String large;
  final String original;
  final String small;
  Thumbs({
    required this.large,
    required this.original,
    required this.small,
  });

  Thumbs copyWith({
    String? large,
    String? original,
    String? small,
  }) {
    return Thumbs(
      large: large ?? this.large,
      original: original ?? this.original,
      small: small ?? this.small,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'large': large,
      'original': original,
      'small': small,
    };
  }

  factory Thumbs.fromMap(Map<String, dynamic> map) {
    return Thumbs(
      large: map['large'],
      original: map['original'],
      small: map['small'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Thumbs.fromJson(String source) => Thumbs.fromMap(json.decode(source));

  @override
  String toString() =>
      'Thumbs(large: $large, original: $original, small: $small)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Thumbs &&
        other.large == large &&
        other.original == original &&
        other.small == small;
  }

  @override
  int get hashCode => large.hashCode ^ original.hashCode ^ small.hashCode;
}
