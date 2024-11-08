import 'package:machinetest_trogun/feature/model/review_model.dart';

class Products {
  int productId;
  String name;
  String description;
  double price;
  String unit;
  String image;
  int discount;
  bool availability;
  String brand;
  String category;
  double rating;
  List<Review>? reviews;

  Products({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.unit,
    required this.image,
    required this.discount,
    required this.availability,
    required this.brand,
    required this.category,
    required this.rating,
    this.reviews,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        productId: json["product_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        unit: json["unit"],
        image: json["image"],
        discount: json["discount"],
        availability: json["availability"],
        brand: json["brand"],
        category: json["category"],
        rating: json["rating"]?.toDouble(),
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "description": description,
        "price": price,
        "unit": unit,
        "image": image,
        "discount": discount,
        "availability": availability,
        "brand": brand,
        "category": category,
        "rating": rating,
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
      };
}
