import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:take_home/controllers/add_controller.dart";
import "package:take_home/controllers/product_controller.dart";

class AddPage extends StatelessWidget {
  final addController = Get.find<AddController>();
  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: addController.titleController,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: addController.priceController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: addController.descriptionController,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: addController.categoryController,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => productController.add(
                  addController.titleController.text,
                  double.tryParse(addController.priceController.text) ?? 0.0,
                  addController.descriptionController.text,
                  addController.categoryController.text,
                ),
                child: const Text("Add Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
