import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/book_club_screen/controller/book_club_controller.dart';

class BookClubBindings extends Bindings{

  @override
  void dependencies() {

    Get.put(BookClubController());
    // TODO: implement dependencies
  }
}