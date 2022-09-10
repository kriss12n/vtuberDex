import 'package:flutter/material.dart';

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
          Image.asset(
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
                          try {} catch (e) {
                            print(e);
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
