import "package:get/get.dart";
import "package:take_home/controllers/add_controller.dart";

class AddBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddController());
  }
}