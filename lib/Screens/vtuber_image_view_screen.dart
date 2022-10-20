import 'package:flutter/material.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/services.dart';

class VtuberImageViewScreen extends StatelessWidget {
  static const routeName = "/image-view-screen";

  const VtuberImageViewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String imageLoaded =
        ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            imageLoaded,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            backgroundColor: Colors.black45,
                            foregroundColor: Colors.white),
                        onPressed: () async {
                          try {
                            await AsyncWallpaper.platformVersion ??
                                'Unknown platform version';
                            await AsyncWallpaper.setWallpaper(
                                url: imageLoaded,
                                wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                                goToHome: false);
                          } on PlatformException {
                            print('Failed to get wallpaper.');
                          }
                        },
                        child: const Text("Establecer como fondo de pantalla")),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
