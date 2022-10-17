import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Audioplayer with ChangeNotifier {
  final player = AudioPlayer();
  bool isPlaying = false;
  bool audioPlayed = false;
  bool isPaused = false;

  void onCompleted() {
    isPlaying = false;
    audioPlayed = false;
    isPaused = false;
    notifyListeners();
  }

  void playSoundAsset(String url) async {
    await player.play(AssetSource(url));
    isPlaying = true;
    audioPlayed = false;
    isPaused = false;
    notifyListeners();
  }

  void pause() async {
    await player.pause();
    isPlaying = false;
    audioPlayed = false;
    isPaused = true;
    notifyListeners();
  }

  void resume() async {
    await player.resume();
    isPlaying = true;
    audioPlayed = false;
    isPaused = false;
    notifyListeners();
  }
}
