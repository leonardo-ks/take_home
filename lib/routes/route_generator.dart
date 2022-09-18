import 'package:get/get.dart';
import 'package:take_home/bindings/add_binding.dart';
import 'package:take_home/bindings/edit_binding.dart';
import 'package:take_home/pages/add_page.dart';
import 'package:take_home/pages/edit_page.dart';
import 'package:take_home/pages/home_page.dart';
import 'package:take_home/routes/route_name.dart';

class RouteGenerator {
  static final routes = [
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.add,
      page: () => AddPage(),
      binding: AddBinding(),
    ),
    GetPage(
      name: RouteName.edit,
      page: () => EditPage(),
      binding: EditBinding(),
    ),
  ];
}
