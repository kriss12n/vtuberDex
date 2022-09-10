import 'package:flutter/material.dart';

class Vtuber {
  final String name;
  final String lore;
  final String debut;
  final String birthday;
  final String country;
  final String image;
  List<String> sounds = [];
  List<String> emotes = [];
  List<String> wallpapers = [];
  List<Color> colors = [];

  Vtuber(
      {required this.name,
      required this.lore,
      required this.birthday,
      required this.debut,
      required this.country,
      required this.emotes,
      required this.sounds,
      required this.colors,
      required this.wallpapers,
      required this.image});
}
