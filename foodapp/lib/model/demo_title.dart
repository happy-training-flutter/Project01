/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

DemoTitle demoTitleFromJson(String str) => DemoTitle.fromJson(json.decode(str));

String demoTitleToJson(DemoTitle data) => json.encode(data.toJson());

class DemoTitle {
    DemoTitle({
        required this.total,
        required this.limit,
        required this.skip,
        required this.products,
    });

    int total;
    int limit;
    int skip;
    List<Product> products;

    factory DemoTitle.fromJson(Map<dynamic, dynamic> json) => DemoTitle(
        total: json["total"],
        limit: json["limit"],
        skip: json["skip"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "skip": skip,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        required this.images,
        required this.thumbnail,
        required this.minimumOrderQuantity,
        required this.rating,
        required this.returnPolicy,
        required this.description,
        required this.weight,
        required this.warrantyInformation,
        required this.title,
        required this.tags,
        required this.discountPercentage,
        required this.reviews,
        required this.price,
        required this.meta,
        required this.shippingInformation,
        required this.id,
        required this.availabilityStatus,
        required this.category,
        required this.stock,
        required this.sku,
        this.brand,
        required this.dimensions,
    });

    List<String> images;
    String thumbnail;
    int minimumOrderQuantity;
    double rating;
    ReturnPolicy returnPolicy;
    String description;
    int weight;
    String warrantyInformation;
    String title;
    List<String> tags;
    double discountPercentage;
    List<Review> reviews;
    double price;
    Meta meta;
    String shippingInformation;
    int id;
    AvailabilityStatus availabilityStatus;
    Category category;
    int stock;
    String sku;
    String? brand;
    Dimensions dimensions;

    factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        images: List<String>.from(json["images"].map((x) => x)),
        thumbnail: json["thumbnail"],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        rating: json["rating"]?.toDouble(),
        returnPolicy: returnPolicyValues.map[json["returnPolicy"]]!,
        description: json["description"],
        weight: json["weight"],
        warrantyInformation: json["warrantyInformation"],
        title: json["title"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        price: json["price"]?.toDouble(),
        meta: Meta.fromJson(json["meta"]),
        shippingInformation: json["shippingInformation"],
        id: json["id"],
        availabilityStatus: availabilityStatusValues.map[json["availabilityStatus"]]!,
        category: categoryValues.map[json["category"]]!,
        stock: json["stock"],
        sku: json["sku"],
        brand: json["brand"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x)),
        "thumbnail": thumbnail,
        "minimumOrderQuantity": minimumOrderQuantity,
        "rating": rating,
        "returnPolicy": returnPolicyValues.reverse[returnPolicy],
        "description": description,
        "weight": weight,
        "warrantyInformation": warrantyInformation,
        "title": title,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "discountPercentage": discountPercentage,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "price": price,
        "meta": meta.toJson(),
        "shippingInformation": shippingInformation,
        "id": id,
        "availabilityStatus": availabilityStatusValues.reverse[availabilityStatus],
        "category": categoryValues.reverse[category],
        "stock": stock,
        "sku": sku,
        "brand": brand,
        "dimensions": dimensions.toJson(),
    };
}

enum AvailabilityStatus { IN_STOCK, LOW_STOCK }

final availabilityStatusValues = EnumValues({
    "In Stock": AvailabilityStatus.IN_STOCK,
    "Low Stock": AvailabilityStatus.LOW_STOCK
});

enum Category { BEAUTY, FRAGRANCES, FURNITURE, GROCERIES }

final categoryValues = EnumValues({
    "beauty": Category.BEAUTY,
    "fragrances": Category.FRAGRANCES,
    "furniture": Category.FURNITURE,
    "groceries": Category.GROCERIES
});

class Dimensions {
    Dimensions({
        required this.depth,
        required this.width,
        required this.height,
    });

    double depth;
    double width;
    double height;

    factory Dimensions.fromJson(Map<dynamic, dynamic> json) => Dimensions(
        depth: json["depth"]?.toDouble(),
        width: json["width"]?.toDouble(),
        height: json["height"]?.toDouble(),
    );

    Map<dynamic, dynamic> toJson() => {
        "depth": depth,
        "width": width,
        "height": height,
    };
}

class Meta {
    Meta({
        required this.createdAt,
        required this.qrCode,
        required this.barcode,
        required this.updatedAt,
    });

    DateTime createdAt;
    String qrCode;
    String barcode;
    DateTime updatedAt;

    factory Meta.fromJson(Map<dynamic, dynamic> json) => Meta(
        createdAt: DateTime.parse(json["createdAt"]),
        qrCode: json["qrCode"],
        barcode: json["barcode"],
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "qrCode": qrCode,
        "barcode": barcode,
        "updatedAt": updatedAt.toIso8601String(),
    };
}

enum ReturnPolicy { NO_RETURN_POLICY, THE_7_DAYS_RETURN_POLICY, THE_90_DAYS_RETURN_POLICY, THE_60_DAYS_RETURN_POLICY, THE_30_DAYS_RETURN_POLICY }

final returnPolicyValues = EnumValues({
    "No return policy": ReturnPolicy.NO_RETURN_POLICY,
    "30 days return policy": ReturnPolicy.THE_30_DAYS_RETURN_POLICY,
    "60 days return policy": ReturnPolicy.THE_60_DAYS_RETURN_POLICY,
    "7 days return policy": ReturnPolicy.THE_7_DAYS_RETURN_POLICY,
    "90 days return policy": ReturnPolicy.THE_90_DAYS_RETURN_POLICY
});

class Review {
    Review({
        required this.date,
        required this.reviewerName,
        required this.reviewerEmail,
        required this.rating,
        required this.comment,
    });

    DateTime date;
    String reviewerName;
    String reviewerEmail;
    int rating;
    String comment;

    factory Review.fromJson(Map<dynamic, dynamic> json) => Review(
        date: DateTime.parse(json["date"]),
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
        rating: json["rating"],
        comment: json["comment"],
    );

    Map<dynamic, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
        "rating": rating,
        "comment": comment,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
