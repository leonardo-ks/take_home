import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:take_home/controllers/edit_controller.dart";
import "package:take_home/controllers/product_controller.dart";
import "package:take_home/data/models/product_model.dart";

class EditPage extends StatelessWidget {
  final editController = Get.find<EditController>();
  final productController = Get.find<ProductController>();
  final int id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final Product product = productController.productById(id);
    editController.titleController.text = product.title.toString();
    editController.priceController.text = product.price.toString();
    editController.descriptionController.text = product.description.toString();
    editController.categoryController.text = product.category.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: editController.titleController,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: editController.priceController,
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
                controller: editController.descriptionController,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: editController.categoryController,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => productController.edit(
                  id,
                  editController.titleController.text,
                  double.tryParse(editController.priceController.text) ?? 0.0,
                  editController.descriptionController.text,
                  editController.categoryController.text,
                ),
                child: const Text("Update Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
