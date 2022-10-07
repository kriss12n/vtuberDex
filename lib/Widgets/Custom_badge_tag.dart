import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBadgeTag extends StatelessWidget {
  final String type;

  const CustomBadgeTag({required this.type, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 30,
      decoration: BoxDecoration(
          color: returnBadgeColor(type),
          borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          returnBadgeIcon(type),
          const SizedBox(width: 10),
          Text(
            type,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

Color returnBadgeColor(String type) {
  if (type == "Dibujante") return const Color(0xff61E0CA);
  if (type == "Gamer") return const Color(0xffFA8585);
  if (type == "Karaoke") return const Color(0xff8FD1FE);
  if (type == "bug") return const Color(0xffFED86F);
  if (type == "Vsinger") return const Color(0xffAEBD3F);
  if (type == "Musico") return const Color(0xffAAAB82);
  return const Color(0xff48D0B0);
}

Widget returnBadgeIcon(String type) {
  if (type == "Dibujante") {
    return const FaIcon((FontAwesomeIcons.paintbrush),
        color: Colors.white, size: 18);
  }
  if (type == "Gamer") {
    return const FaIcon((FontAwesomeIcons.gamepad),
        color: Colors.white, size: 18);
  }
  if (type == "Karaoke") {
    return const FaIcon((FontAwesomeIcons.music),
        color: Colors.white, size: 18);
  }
  if (type == "Vsinger") {
    return const FaIcon((FontAwesomeIcons.microphone),
        color: Colors.white, size: 18);
  }
  if (type == "Musico") {
    return const FaIcon((FontAwesomeIcons.music),
        color: Colors.white, size: 18);
  }
  return const FaIcon((FontAwesomeIcons.gamepad),
      color: Colors.white, size: 18);
}
