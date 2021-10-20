// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class AnimeModel extends Equatable {
  final int id;
  final AnimeData data;
  const AnimeModel({
    required this.id,
    required this.data,
  });

  AnimeModel copyWith({
    int? id,
    AnimeData? data,
  }) {
    return AnimeModel(
      id: id ?? this.id,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data.toMap(),
    };
  }

  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    return AnimeModel(
      id: map['id'],
      data: AnimeData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimeModel.fromJson(String source) =>
      AnimeModel.fromMap(json.decode(source));

  @override
  String toString() => 'AnimeItem(id: $id, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnimeModel && other.id == id && other.data == data;
  }

  @override
  int get hashCode => id.hashCode ^ data.hashCode;

  @override
  List<Object?> get props => [id, data];
}

//-----------------------------------------------
//

class AnimeData {
  final String og_title;
  final String og_description;
  final AnimeImage og_image;
  AnimeData({
    required this.og_title,
    required this.og_description,
    required this.og_image,
  });

  AnimeData copyWith({
    String? og_title,
    String? og_description,
    AnimeImage? og_image,
  }) {
    return AnimeData(
      og_title: og_title ?? this.og_title,
      og_description: og_description ?? this.og_description,
      og_image: og_image ?? this.og_image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'og_title': og_title,
      'og_description': og_description,
      'og_image': og_image.toMap(),
    };
  }

  factory AnimeData.fromMap(Map<String, dynamic> map) {
    return AnimeData(
      og_title: map['og_title'],
      og_description: map['og_description'],
      og_image: AnimeImage.fromMap(map['og_image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimeData.fromJson(String source) =>
      AnimeData.fromMap(json.decode(source));

  @override
  String toString() =>
      'AnimeData(og_title: $og_title, og_description: $og_description, og_image: $og_image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnimeData &&
        other.og_title == og_title &&
        other.og_description == og_description &&
        other.og_image == og_image;
  }

  @override
  int get hashCode =>
      og_title.hashCode ^ og_description.hashCode ^ og_image.hashCode;
}

//-----------------------------------------------
//

class AnimeImage {
  final double width;
  final double height;
  final String url;
  AnimeImage({
    required this.width,
    required this.height,
    required this.url,
  });

  AnimeImage copyWith({
    double? width,
    double? height,
    String? url,
  }) {
    return AnimeImage(
      width: width ?? this.width,
      height: height ?? this.height,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'width': width,
      'height': height,
      'url': url,
    };
  }

  factory AnimeImage.fromMap(Map<String, dynamic> map) {
    return AnimeImage(
      width: map['width'],
      height: map['height'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimeImage.fromJson(String source) =>
      AnimeImage.fromMap(json.decode(source));

  @override
  String toString() => 'AnimeImage(width: $width, height: $height, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnimeImage &&
        other.width == width &&
        other.height == height &&
        other.url == url;
  }

  @override
  int get hashCode => width.hashCode ^ height.hashCode ^ url.hashCode;
}
