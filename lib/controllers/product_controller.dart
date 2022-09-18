import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";
import "package:take_home/data/models/product_model.dart";
import "package:take_home/data/remote/remote_data_source.dart";

class ProductController extends GetxController {
  var products = List<Product>.empty().obs;
  bool isLoadingData = true;

  @override
  void onInit() {
    super.onInit();
    getRemoteData();
  }

  void getRemoteData() {
    RemoteDataSource().getAllRemoteProducts().then(
          (value) => {
            products.addAll(
              List<Product>.from(
                value.body.map(
                  (e) => Product.fromJson(e),
                ),
              ),
            ),
          },
        );
  }

  void errorSnackBar(String message) {
    Get.snackbar(
      "Error",
      message,
      duration: const Duration(seconds: 2),
    );
  }

  void add(String title, double price, String description, String category) {
    if (title != "" && description != "" && category != "") {
      int id = int.tryParse(
        DateFormat("yyyyMMddhhmmss").format(
          DateTime.now(),
        ),
      )!;
      Product product = Product(
        id,
        title,
        price,
        description,
        category,
        null,
        null,
      );
      products.add(product);
      Get.back();
    } else {
      errorSnackBar("All data must be filled");
    }
  }

  Product productById(int id) {
    return products.firstWhere((element) => element.id == id);
  }

  void edit(
      int id, String title, double price, String description, String category) {
    if (title != "" && description != "" && category != "") {
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

  Future<bool> delete(int id) async {
    bool deleted = false;
    await Get.defaultDialog(
      title: "Delete",
      middleText: "Are you sure you want to delete this product?",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onConfirm: () {
        products.removeWhere((element) => element.id == id);
        deleted = true;
        Get.back();
      },
      textCancel: "No",
    );
    return deleted;
  }
}
