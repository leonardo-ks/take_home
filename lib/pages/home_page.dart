import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_home/controllers/product_controller.dart';
import 'package:take_home/routes/route_name.dart';

class HomePage extends StatelessWidget {
  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(RouteName.add);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(20),
            child: productController.products.isEmpty
                ? const Center(
                    child: Text(
                      'Products is empty',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, i) => Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: ListTile(
                        leading: SizedBox(
                          height: double.infinity,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            child: productController.products[i].image != null
                                ? Image.network(
                                    '${productController.products[i].image}',
                                    height: 150,
                                  )
                                : const Icon(
                                    Icons.pages,
                                  ),
                          ),
                        ),
                        title: Text("${productController.products[i].title}"),
                        subtitle: Text(
                            "${productController.products[i].description}"),
                        trailing: PopupMenuButton(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 0,
                              child: Text(
                                "Edit",
                              ),
                            ),
                            const PopupMenuItem(
                              value: 1,
                              child: Text(
                                "Delete",
                              ),
                            ),
                          ],
                          onSelected: (value) {
                            switch (value) {
                              case 0:
                                Get.toNamed(
                                  RouteName.edit,
                                  arguments: productController.products[i].id,
                                );
                                break;
                              case 1:
                                productController.delete(
                                  productController.products[i].id,
                                );
                                break;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
