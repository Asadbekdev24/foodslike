import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String category;
  final String image;
  @JsonKey(name: "is_favorite")
 bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.category,
    required this.image,
    required this.isFavorite,
  });

// bu json ma'lumotni dart tilida bir class yaratib keyin uni obyektiga jsondagi ma'lumotlarni obyektga olib o'tadi
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

// bu esa dart classdan yaratilgan ma'lumotlarni map ga o'girib beradi
  Map<String, dynamic> productModelToJson() {
    return _$ProductModelToJson(this);
  }
}
