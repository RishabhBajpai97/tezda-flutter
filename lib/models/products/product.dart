import 'package:mobx/mobx.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product extends _Product with _$Product {
  static Product fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  static Map<String, dynamic> toJson(Product product) =>
      _$ProductToJson(product);
}

abstract class _Product with Store {
  @observable
  @JsonKey(name: "id")
  int? id;
  @observable
  @JsonKey(name: "image")
  String? image;
  @observable
  @JsonKey(name: "title")
  String? title;
  @observable
  @JsonKey(name: "description")
  String? description;
  @observable
  @JsonKey(name: "isFav", defaultValue: false)
  bool? isFavorite;
  @observable
  @JsonKey(name: "price")
  double? price;
}
