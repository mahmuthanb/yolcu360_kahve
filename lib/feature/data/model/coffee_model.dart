import 'package:json_annotation/json_annotation.dart';

part 'coffee_model.g.dart';

@JsonSerializable()
class CoffeeModel {
  String title;
  String description;
  List<String> ingredients;
  String image;
  int id;
  int price;

  CoffeeModel({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.id,
    required this.price,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return _$CoffeeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoffeeModelToJson(this);
}
