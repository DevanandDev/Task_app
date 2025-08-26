class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromjson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData["id"],
      title: jsonData["title"],
      price: jsonData["price"],
      category: jsonData["category"],
      description: jsonData["description"],
      image: jsonData["image"],
      rating: Rating.fromjson(jsonData["rating"]),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromjson(Map<String, dynamic> rateData) {
    return Rating(rate: rateData["rate"], count: rateData["count"]);
  }
}
