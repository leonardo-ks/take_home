class Product {
  int id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product(
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  );

  Product.fromJson(Map<String, dynamic> json):
      id = json["id"],
      title = json["title"],
      price = json["price"],
      description = json["description"],
      category = json["category"],
      image = json["image"],
      rating = Rating.fromJson(json["rating"]);
}

class Rating {
  dynamic rate;
  int count;

  Rating(
    this.rate,
    this.count,
  );

  Rating.fromJson(Map<String, dynamic> json):
        rate = json["rate"],
        count = json["count"];
}
