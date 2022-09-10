import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtuberdex/Screens/vtuber_image_view_screen.dart';
import 'package:vtuberdex/Widgets/Card_dates.dart';
import '../Provider/vtubers.dart';
import 'package:audioplayers/audioplayers.dart';

class VtuberDetailScreen extends StatelessWidget {
  const VtuberDetailScreen({super.key});

  static const routeName = "/vtuber-detail";

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    final vtuber = Provider.of<Vtubers>(context).findByID(name);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0)),
                      gradient: LinearGradient(
                          colors: vtuber.colors,
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft),
                    ),
                    child: Hero(
                      tag: vtuber.name,
                      child: Image.asset(
                        vtuber.image,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  vtuber.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  vtuber.country,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  vtuber.lore,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardDates(vtuber.birthday, "Cumpleaños"),
                  CardDates(vtuber.debut, "Debut"),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Algunos Emotes",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: vtuber.emotes.map((emote) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Color(0xff424350),
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          builder: (context) => Column(
                            children: [
                              const SizedBox(height: 10.0),
                              const Text(
                                "Emotes",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              const SizedBox(height: 15.0),
                              Expanded(
                                child: GridView.builder(
                                    padding: const EdgeInsets.all(10.0),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: vtuber.emotes.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            childAspectRatio: 3 / 2,
                                            crossAxisSpacing: 5.0,
                                            mainAxisSpacing: 10.0),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Image.asset(
                                          vtuber.emotes[index],
                                          width: 32,
                                          height: 32,
                                        ),
                                      );
                                    }),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child:
                                    const Text("Instalar emotes en whatsapp"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cerrar"),
                              ),
                              const SizedBox(height: 40.0),
                            ],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          emote,
                          width: 64,
                          height: 64,
                        ),
                      ),
                    );
                  }).toList()),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Wallpapers",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: vtuber.wallpapers.map((wall) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            VtuberImageViewScreen.routeName,
                            arguments: wall);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          wall,
                          width: 100,
                          height: 230,
                        ),
                      ),
                    );
                  }).toList()),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Sonidos",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              /*  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.orangeAccent,
                        ),
                        width: 70,
                        height: 70,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () async {
                                final player = AudioPlayer();
                                await player.setSource(
                                    AssetSource("sounds/melty/puto.mp3"));
                              },
                              icon: const Icon(Icons.play_arrow_rounded),
                              color: Colors.white,
                            ),
                            const Text(
                              "Puto",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ) */
            ],
          ),
        ),
      ),
    );
  }
}
