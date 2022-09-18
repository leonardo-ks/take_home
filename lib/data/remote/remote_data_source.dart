import "package:get/get.dart";

class RemoteDataSource extends GetConnect {
  final url = "https://fakestoreapi.com";

  Future<Response> getAllRemoteProducts() => get("$url/products");
}