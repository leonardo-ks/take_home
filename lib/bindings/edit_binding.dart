import 'package:get/get.dart';
import 'package:take_home/controllers/edit_controller.dart';

class EditBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EditController());
  }
}