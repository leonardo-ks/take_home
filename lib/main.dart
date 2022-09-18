import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:take_home/controllers/product_controller.dart";
import "package:take_home/pages/home_page.dart";
import "package:take_home/routes/route_generator.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      getPages: RouteGenerator.routes,
    );
  }
}
