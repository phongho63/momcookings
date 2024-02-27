import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/food_info/food_details_info/food_details_info.dart';

class FoodDetailsRepositoryImpl {
  final _db = FirebaseFirestore.instance;

  Future<FoodDetailsInfo>? getFoodDetailsInfo(String id) async {
    final snapshot = await _db.collection("foodContent").doc(id).get();
    final responseFoodDetails = FoodDetailsInfo.fromSnapshot(snapshot);
    return responseFoodDetails;
  }

  Future<List<FoodDetailsInfo>> getListFood() async {
    final snapshot = await _db.collection("foodContent").get();
    final responseFoodList =
        snapshot.docs.map((e) => FoodDetailsInfo.fromSnapshot(e)).toList();
    return responseFoodList;
  }
}
