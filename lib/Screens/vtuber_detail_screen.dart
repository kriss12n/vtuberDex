import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtuberdex/Widgets/Card_dates.dart';
import '../Models/vtuber.dart';
import '../Provider/vtubers.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: vtuber.name,
                    child: Image.asset(
                      vtuber.image,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back))
                ],
              ),
              const SizedBox(height: 15),
              Text(
                vtuber.name,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                vtuber.country,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              const SizedBox(height: 15),
              Text(
                vtuber.lore,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
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
              const Text(
                "Algunos Emotes",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: vtuber.emotes.map((emote) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        builder: (context) => Column(
                          children: [
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
                              onPressed: () {},
                              child: const Text("Instalar emotes en whatsapp"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Cerrar"),
                            ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
