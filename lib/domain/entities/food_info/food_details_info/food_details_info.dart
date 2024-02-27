import 'package:cloud_firestore/cloud_firestore.dart';

class FoodDetailsInfo {
  String foodId = "";
  String foodName = "";
  int foodPrice = 0;
  String foodDescription = "";
  List<String> foodTags = [];
  int foodRange = 0;
  String foodRating = "";

  FoodDetailsInfo.buildDefault();
  FoodDetailsInfo(
      {required this.foodId,
      required this.foodName,
      required this.foodPrice,
      required this.foodDescription,
      required this.foodTags,
      required this.foodRange,
      required this.foodRating});

  toJson() {
    return {
      "foodName": foodName,
      "foodPrice": foodPrice,
      "foodDescription": foodDescription,
      "foodTags": foodTags,
      "foodRange": foodRange,
      "foodRating": foodRating
    };
  }

  factory FoodDetailsInfo.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return FoodDetailsInfo(
        foodId: document.id,
        foodDescription: data?["foodDescription"] ?? "",
        foodName: data?["foodName"] ?? "",
        foodPrice: data?["foodPrice"] ?? 0,
        foodRange: data?["foodRange"] ?? 0,
        foodRating: data?["foodRating"] ?? "",
        foodTags: List<String>.from(data?["foodTags"] ?? []));
  }
}
