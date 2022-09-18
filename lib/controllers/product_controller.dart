import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_home/models/product_model.dart';

class ProductController extends GetxController {
  var products = List<ProductModel>.empty().obs;

  void errorSnackBar(String message) {
    Get.snackbar(
      "Error",
      message,
      duration: const Duration(seconds: 2),
    );
  }

  void add(String title, double price, String description, String category) {
    if (title != '' && description != '' && category != '') {
      products.add(
        ProductModel(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          description: description,
          category: category,
        ),
      );
      Get.back();
    } else {
      errorSnackBar("All data must be filled");
    }
  }

  ProductModel productById(String id) {
    return products.firstWhere((element) => element.id == id);
  }

  void edit(String id, String title, double price, String description,
      String category) {
    if (title != '' && description != '' && category != '') {
      final product = productById(id);
      product.title = title;
      product.price = price;
      product.description = description;
      product.category = category;
      products.refresh();
      Get.back();
    } else {
      errorSnackBar("All data must be filled");
    }
  }

  Future<bool> delete(String id) async {
    bool deleted = false;
    await Get.defaultDialog(
      title: 'Delete',
      middleText: 'Are you sure you want to delete this product?',
      textConfirm: 'Yes',
      confirmTextColor: Colors.white,
      onConfirm: () {
        products.removeWhere((element) => element.id == id);
        deleted = true;
        Get.back();
      },
      textCancel: 'No',
    );
    return deleted;
  }
}
