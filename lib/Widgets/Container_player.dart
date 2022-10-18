import 'package:audioplayers/audioplayers.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vtuberdex/Models/Audio.dart';

class ContainerPlayer extends StatefulWidget {
  final Audio audio;
  const ContainerPlayer({required this.audio, super.key});

  @override
  State<ContainerPlayer> createState() => _ContainerPlayerState();
}

class _ContainerPlayerState extends State<ContainerPlayer> {
  final player = AudioPlayer();
  bool audioPlayed = false;
  bool isPlaying = false;
  bool isPaused = false;

  @override
  Widget build(BuildContext context) {
    void playSoundAsset(String url) async {
      await player.play(AssetSource(url));
      setState(() {
        isPlaying = true;
        audioPlayed = false;
        isPaused = false;
      });
    }

    void pause() async {
      await player.pause();

      setState(() {
        isPlaying = false;
        audioPlayed = false;
        isPaused = true;
      });
    }

    void resume() async {
      await player.resume();

      setState(() {
        isPlaying = true;
        audioPlayed = false;
        isPaused = false;
      });
    }

    void onCompleted() {
      isPlaying = false;
      audioPlayed = false;
      isPaused = false;
      setState(() {});
    }

    player.onPlayerComplete.listen((event) {
      onCompleted();
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
            if (!audioPlayed && isPlaying && !isPaused)
              IconButton(
                splashRadius: 15.0,
                onPressed: () async {
                  pause();
                },
                icon: const Icon(Icons.pause),
                color: Colors.white,
              ),
            if (!audioPlayed && !isPlaying && isPaused)
              IconButton(
                splashRadius: 15.0,
                onPressed: () async {
                  resume();
                },
                icon: const Icon(Icons.play_arrow),
                color: Colors.white,
              ),
            if (!audioPlayed && !isPlaying && !isPaused)
              IconButton(
                splashRadius: 15.0,
                onPressed: () async {
                  playSoundAsset(widget.audio.url);
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
  }
}
