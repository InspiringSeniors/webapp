import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/art_gallery/controller/art_gallery_controller.dart';

class ArtGalleryBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ArtGalleryController());
  }
}