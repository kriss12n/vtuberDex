import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtuberdex/Models/vtuber.dart';
import 'package:vtuberdex/Provider/vtubers.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:vtuberdex/Screens/vtuber_detail_screen.dart';

class MainVtuberScreen extends StatelessWidget {
  const MainVtuberScreen({super.key});

  static const routeName = "/main-vtuber-screen";
  @override
  Widget build(BuildContext context) {
    List<Vtuber> vtuberslist = Provider.of<Vtubers>(context).vtuberList;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          title: const Text("VtuberDEX",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffA694F1)))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 15.0),
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 3 / 3),
            itemCount: vtuberslist.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                    VtuberDetailScreen.routeName,
                    arguments: vtuberslist[index].name),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
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
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: vtuberslist[index].colors)),
                      ),
                    ),
                    GridTile(
                      footer: GridTileBar(
                          title: BorderedText(
                        strokeWidth: 2.0,
                        child: Text(
                          vtuberslist[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                      child: AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Hero(
                          tag: vtuberslist[index].name,
                          child: Image.asset(
                            vtuberslist[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
