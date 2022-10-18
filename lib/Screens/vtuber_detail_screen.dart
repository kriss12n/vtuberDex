import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vtuberdex/Screens/vtuber_image_view_screen.dart';
import 'package:vtuberdex/Widgets/Card_dates.dart';
import 'package:vtuberdex/Widgets/Card_social_media.dart';
import 'package:vtuberdex/Widgets/Container_player.dart';
import 'package:vtuberdex/Widgets/Custom_badge_tag.dart';
import 'package:vtuberdex/Widgets/Labels.dart';
import '../Provider/vtubers.dart';

class VtuberDetailScreen extends StatelessWidget {
  const VtuberDetailScreen({super.key});

  static const routeName = "/vtuber-detail";

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    final vtuber = Provider.of<Vtubers>(context).findByID(name);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverAppBar(
                backgroundColor: Colors.black,
                pinned: true,
                floating: true,
                centerTitle: true,
                expandedHeight: 350,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
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
                          gradient: LinearGradient(
                              colors: vtuber.colors,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                        ),
                        child: Hero(
                          tag: vtuber.name,
                          child: Image.asset(
                            vtuber.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.black54),
                      child: const TabBar(
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey,
                          tabs: [Tab(text: "Canal"), Tab(text: "Vtuber")]),
                    ))),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const TabBarView(
                  children: <Widget>[Tab1(), Tab2()],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    final vtuber = Provider.of<Vtubers>(context).findByID(name);
    return ClipRRect(
      borderRadius: BorderRadius.circular((20.0)),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
            SizedBox(
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 5.0,
                spacing: 5.0,
                children: vtuber.types.map((e) {
                  return CustomBadgeTag(type: e);
                }).toList(),
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
                "Redes sociales",
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 15.0),
                  CardSocialMedia(
                      icon: const FaIcon(FontAwesomeIcons.youtube,
                          color: Colors.white),
                      color: Colors.red,
                      url: vtuber.youtube),
                  const SizedBox(width: 15.0),
                  CardSocialMedia(
                      icon: const FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Colors.white,
                      ),
                      color: Colors.lightBlue,
                      url: vtuber.twitter),
                  const SizedBox(width: 15.0),
                  CardSocialMedia(
                      icon: const FaIcon(
                        FontAwesomeIcons.twitch,
                        color: Colors.white,
                      ),
                      color: Colors.indigo,
                      url: vtuber.twitch),
                  const SizedBox(width: 15.0),
                  CardSocialMedia(
                      icon: const FaIcon(
                        FontAwesomeIcons.tiktok,
                        color: Colors.white,
                      ),
                      color: Colors.black,
                      url: vtuber.tiktok),
                  const SizedBox(width: 15.0),
                  CardSocialMedia(
                      icon: const FaIcon(
                        FontAwesomeIcons.discord,
                        color: Colors.white,
                      ),
                      color: Colors.deepPurpleAccent,
                      url: vtuber.tiktok),
                  const SizedBox(width: 15.0),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
                        backgroundColor: const Color(0xff424350),
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
                                  physics: const NeverScrollableScrollPhysics(),
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
                              onPressed: () async {
                                try {
                                  const url = "https://sticker.ly/s/YTURI1";
                                  if (await canLaunchUrlString(url)) {
                                    launchUrlString(url,
                                        mode: LaunchMode.externalApplication);
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: const Text("Instalar emotes en whatsapp"),
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
                      child: Image.network(
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: vtuber.sounds.length,
                itemBuilder: ((context, index) {
                  return ContainerPlayer(audio: vtuber.sounds[index]);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    final vtuber = Provider.of<Vtubers>(context).findByID(name);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Detalles Basicos",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 15),
          Labels(label: "Nombre original", data: vtuber.nameVtuber),
          const SizedBox(height: 15),
          Labels(label: "Apodos", data: vtuber.nicknames),
          const SizedBox(height: 15),
          Labels(label: "Fecha de debut", data: vtuber.debut),
          const SizedBox(height: 15),
          Labels(label: "Ilustrador", data: vtuber.live2d),
          const SizedBox(height: 15),
          Labels(label: "Rigger", data: vtuber.rigger),
          const SizedBox(height: 15),
          Labels(
            label: "Accesorios",
            data: vtuber.accesories,
          ),
          const SizedBox(height: 15),
          Labels(label: "Modelo 3D", data: vtuber.model3d),
          const SizedBox(height: 15),
          Labels(label: "Afiliación", data: vtuber.afiliation),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Detalles Personales",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 15),
          Labels(label: "Genero", data: vtuber.gender),
          const SizedBox(height: 15),
          Labels(label: "Edad", data: "${vtuber.age} años"),
          const SizedBox(height: 15),
          Labels(label: "Cumpleaños", data: vtuber.birthday),
          const SizedBox(height: 15),
          Labels(label: "Altura", data: vtuber.height),
          const SizedBox(height: 15),
          Labels(label: "Animal Favorito", data: vtuber.favoriteAnimal),
          const SizedBox(height: 15),
          Labels(label: "Color favorito", data: vtuber.favoriteColor),
          const SizedBox(height: 15),
          Labels(label: "Comida favorita", data: vtuber.favoriteFood),
          const SizedBox(height: 15),
          Labels(label: "Hobbies", data: vtuber.hobbies),
          const SizedBox(height: 15),
        ],
      )),
    );
  }
}
