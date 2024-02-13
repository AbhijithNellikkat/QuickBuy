// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
    int  ? id;
    String ?  title;
    int  ? price;
    String ?  description;
    List<String>  ? images;
    DateTime ?  creationAt;
    DateTime  ? updatedAt;
    Category  ? category;

    ProductsModel({
        this.id,
        this.title,
        this.price,
        this.description,
        this.images,
        this.creationAt,
        this.updatedAt,
        this.category,
    });

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "creationAt": creationAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "category": category!.toJson(),
    };
}

class Category {
    int ?  id;
    Name ?  name;
    String ?  image;
    DateTime ?  creationAt;
    DateTime  ? updatedAt;

    Category({
        this.id,
        this.name,
        this.image,
        this.creationAt,
        this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]],
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image,
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

enum Name {
    CLOTHESGG,
    ELECTRONICS,
    FURNITURE,
    MISCELLANEOUS,
    SHOES
}

final nameValues = EnumValues({
    "Clothesgg": Name.CLOTHESGG,
    "Electronics": Name.ELECTRONICS,
    "Furniture": Name.FURNITURE,
    "Miscellaneous": Name.MISCELLANEOUS,
    "Shoes": Name.SHOES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
