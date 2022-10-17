import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vtuberdex/Models/Audio.dart';
import 'package:vtuberdex/Provider/audioplayer.dart';

class ContainerPlayer extends StatefulWidget {
  final Audio audio;
  const ContainerPlayer({required this.audio, super.key});

  @override
  State<ContainerPlayer> createState() => _ContainerPlayerState();
}

class _ContainerPlayerState extends State<ContainerPlayer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Audioplayer>(builder: ((context, player, child) {
      player.player.onPlayerComplete.listen((event) {
        player.onCompleted();
      });
      return Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        child: BlurryContainer(
          height: 55,
          blur: 10,
          width: double.infinity * 0.70,
          elevation: 6,
          color: Colors.red.withOpacity(0.15),
          child: Row(
            children: [
              if (!player.audioPlayed && player.isPlaying && !player.isPaused)
                IconButton(
                  splashRadius: 15.0,
                  onPressed: () async {
                    player.pause();
                  },
                  icon: const Icon(Icons.pause),
                  color: Colors.white,
                ),
              if (!player.audioPlayed && !player.isPlaying && player.isPaused)
                IconButton(
                  splashRadius: 15.0,
                  onPressed: () async {
                    player.resume();
                  },
                  icon: const Icon(Icons.play_arrow),
                  color: Colors.white,
                ),
              if (!player.audioPlayed && !player.isPlaying && !player.isPaused)
                IconButton(
                  splashRadius: 15.0,
                  onPressed: () async {
                    player.playSoundAsset(widget.audio.url);
                  },
                  icon: const Icon(Icons.play_arrow_rounded),
                  color: Colors.white,
                ),
              Text(
                widget.audio.name,
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(flex: 1),
              IconButton(
                  splashRadius: 15.0,
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.ellipsisVertical,
                      color: Colors.white))
            ],
          ),
        ),
      );
    }));
  }
}
