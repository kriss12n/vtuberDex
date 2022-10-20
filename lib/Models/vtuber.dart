import 'package:flutter/material.dart';
import 'package:vtuberdex/Models/Audio.dart';

class Vtuber {
  final String name;
  final String lore;
  final String debut;
  final String birthday;
  final String country;
  final String image;
  List<Audio> sounds = [];
  List<String> emotes = [];
  List<String> wallpapers = [];
  List<String> modelos = [];
  List<String> types = [];
  List<Color> colors = [];
  final String nameVtuber;
  final String nicknames;
  final String live2d;
  final String rigger;
  final String model3d;
  final String accesories;
  final String afiliation;
  final String twitter;
  final String tiktok;
  final String twitch;
  final String youtube;
  final String discord;
  final String gender;
  final String age;
  final String height;
  final String favoriteFood;
  final String favoriteAnimal;
  final String favoriteColor;
  final String hobbies;
  final String status;

  Vtuber({
    required this.name,
    required this.lore,
    required this.birthday,
    required this.debut,
    required this.country,
    required this.emotes,
    required this.sounds,
    required this.colors,
    required this.wallpapers,
    required this.modelos,
    required this.image,
    required this.nameVtuber,
    required this.nicknames,
    required this.live2d,
    required this.model3d,
    required this.rigger,
    required this.accesories,
    required this.afiliation,
    required this.twitch,
    required this.tiktok,
    required this.twitter,
    required this.youtube,
    required this.gender,
    required this.discord,
    required this.age,
    required this.height,
    required this.favoriteAnimal,
    required this.favoriteFood,
    required this.favoriteColor,
    required this.hobbies,
    required this.status,
    required this.types,
  });
}
