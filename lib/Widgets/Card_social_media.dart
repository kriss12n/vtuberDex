import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CardSocialMedia extends StatelessWidget {
  final Widget icon;
  final Color color;
  final String url;

  const CardSocialMedia(
      {super.key, required this.icon, required this.color, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          print(url);
          if (await canLaunchUrlString(url)) {
            launchUrlString(url, mode: LaunchMode.externalApplication);
          }
        } catch (e) {
          print("hola $e");
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
        width: 64,
        height: 64,
        child: Center(child: icon),
      ),
    );
  }
}
