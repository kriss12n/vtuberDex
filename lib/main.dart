import 'package:flutter/material.dart';
import 'package:vtuberdex/Provider/vtubers.dart';
import 'package:vtuberdex/Screens/main_vtuber_screen.dart';
import 'package:provider/provider.dart';
import 'package:vtuberdex/Screens/vtuber_detail_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Vtubers(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: MainVtuberScreen.routeName,
        theme: ThemeData(fontFamily: "Lato"),
        routes: {
          MainVtuberScreen.routeName: (context) => const MainVtuberScreen(),
          VtuberDetailScreen.routeName: (context) => const VtuberDetailScreen(),
        },
      ),
    );
  }
}
