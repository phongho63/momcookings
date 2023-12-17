import 'package:flutter/cupertino.dart';

import '../../../../common/base_controller.dart';
import '../../../../domain/entities/food_info/food_details_info/food_details_info.dart';
import '../../../utils/global.dart';

class FoodDetailsController extends BaseController {
  FoodDetailsController({required this.data});

  int amount = 1;
  int maxRange = 0;
  int minRange = 1;
  FoodDetailsInfo? data;

  @override
  void firstLoad() {
    showLoadingProgress();
    if (data != null) {
      maxRange = data!.foodRange;
      hideLoadingProgress();
    } else {
      debugPrint("Data is null");
      hideLoadingProgress();
    }
  }

  @override
  void onListener() {}

  void increaseAmount() {
    if (amount == maxRange) {
      amount == maxRange;
    } else {
      amount = amount + 1;
    }
    refreshUI();
  }

  void decreaseAmount() {
    if (amount == minRange) {
      amount = minRange;
    } else {
      amount = amount - 1;
    }
    refreshUI();
  }

  void updateCart(String itemId) {

    // Will implement in the future

    // if (!Global.totalNewItemsInCart.contains(itemId)) {
    //   Global.totalNewItemsInCart.add(itemId);
    // }

    view.onBack();
  }
}
