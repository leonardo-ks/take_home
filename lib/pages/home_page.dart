import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:take_home/controllers/product_controller.dart";
import "package:take_home/routes/route_name.dart";

class HomePage extends StatelessWidget {
  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
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
            padding: const EdgeInsets.all(10),
            child: productController.products.isEmpty
                ? const Center(
                    child: Text(
                      "Products is empty",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (context, i) => Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                productController.products[i].image != null
                                    ? Image.network(
                                        "${productController.products[i].image}",
                                        fit: BoxFit.contain,
                                      )
                                    : const Icon(Icons.widgets),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${productController.products[i].title}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  Text(
                                    "${productController.products[i].category}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 12),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${productController.products[i].description}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${productController.products[i].price?.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            "${productController.products[i].rating?.rate ?? 0.00}",
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onLongPress: () => Get.defaultDialog(
                        title: "Options",
                        middleText: "Select one option",
                        actions: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: TextButton(
                              onPressed: () => {
                                Get.back(),
                                Get.toNamed(
                                  RouteName.edit,
                                  arguments:
                                      productController.products[i].id,
                                ),
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.edit,
                                  ),
                                  Text(
                                    "Edit",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: TextButton(
                              onPressed: () => {
                                Get.back(),
                                productController.delete(
                                    productController.products[i].id),
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.delete_forever,
                                  ),
                                  Text(
                                    "Delete",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        cancel: TextButton(
                          onPressed: () => Get.back(),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
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
