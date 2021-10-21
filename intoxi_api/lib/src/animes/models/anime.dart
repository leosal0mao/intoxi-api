// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'anime_data.dart';

class Anime extends Equatable {
  final int id;
  final AnimeData data;
  const Anime({
    required this.id,
    required this.data,
  });

  @override
  List<Object?> get props => [id, data];
}
