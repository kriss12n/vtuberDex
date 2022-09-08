import 'package:flutter/material.dart';
import 'package:vtuberdex/Models/Vtuber.dart';

class Vtubers with ChangeNotifier {
  List<Vtuber> vtubers = [
    Vtuber(
        name: "Melty",
        birthday: "Sept. 13",
        debut: "Febr. 13",
        country: "Chile",
        emotes: [
          "assets/emotes/melty/1.png",
          "assets/emotes/melty/2.png",
          "assets/emotes/melty/3.png",
          "assets/emotes/melty/4.png",
          "assets/emotes/melty/5.png",
        ],
        sounds: [],
        colors: [Color(0xff7663ED), Color.fromARGB(20, 69, 64, 224)],
        lore:
            "Hewwo~ soy Melty Me gustan mucho los juegos mmo/rpg y survival, me encanta divertirme jugando ya sea sola o en multijugador(en especial en multijugador).Tengo una fascinación por los anime de genero Isekai / Love Comedy, y las novelas ligeras.Sí, soy bastante Otaku",
        image: "assets/images/melty_grande.png"),
    Vtuber(
        name: "Triuwu",
        birthday: "Sept. 8",
        debut: "Febr. 13",
        country: "Panamá",
        emotes: [],
        sounds: [],
        colors: [Color(0xffEBFF00), Color.fromARGB(20, 246, 248, 102)],
        lore:
            "Muy buenas! soy una pequeña artista nacida en un hermoso y utópico lugar llamado Latinoamérica, en Panamá para ser más precisos. Me gustan las monas chinas y simpeo profesionalmente otras vtubers xDDDD Mi trabajo no será la gran cosa, pero es honesto y lo hago con cariño, asi que espero que les guste las pendejadas que haga uwu",
        image: "assets/images/tri.png"),
    Vtuber(
        name: "Chiimuu",
        birthday: "?",
        debut: "¿",
        country: "ChiimuuLandia",
        emotes: [],
        sounds: [],
        colors: [Color(0xffFF0000), Color.fromARGB(20, 148, 40, 40)],
        lore:
            "Buenas! puedes decirme chimu, chumi, mich- así no era. Mi vida es un chiste Y NO SOY GATA!!1! créanme xfa.",
        image: "assets/images/chomo.png"),
    Vtuber(
        name: "Kotone",
        birthday: "Jul. 15",
        debut: "Nov. 15",
        country: "Chile",
        emotes: [],
        sounds: [],
        colors: [Color(0xffE3E2ED), Color.fromARGB(20, 160, 160, 166)],
        lore:
            "Kotone who? Yo solo conozco a Potone, la joven promesa del vtubing hispano ᏊºัꈊºัᏊ Solo soy una oveja mañosa con pezuñas afiladas así que pórtate bien~ Bienvenid@ al corral ♡!! 🐑",
        image: "assets/images/kotone.png"),
  ];

  List<Vtuber> get vtuberList {
    return [...vtubers];
  }

  Vtuber findByID(String name) {
    return vtubers.firstWhere((v) => v.name == name);
  }
}
