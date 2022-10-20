import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class VtuberModelViewScreen extends StatelessWidget {
  const VtuberModelViewScreen({super.key});

  static const routeName = "/model-view-screen";

  @override
  Widget build(BuildContext context) {
    Map params = ModalRoute.of(context)!.settings.arguments as Map;
    List<String> galleryModels = params['models'];

    return Scaffold(
        body: PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      itemCount: galleryModels.length,
      wantKeepAlive: true,
      builder: ((context, index) {
        String urlImage = galleryModels[index];

        return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(urlImage),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.contained * 4,
            heroAttributes: PhotoViewHeroAttributes(tag: urlImage));
      }),
    ));
  }
}
