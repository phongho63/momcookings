import '../../../../common/base_controller.dart';
import '../../../../data/repositories_impl/food_details_repository_impl/food_details_repository_impl.dart';
import '../../../../domain/entities/food_info/food_details_info/food_details_info.dart';

class FoodDetailsController extends BaseController {
  FoodDetailsController({required this.data});

  int amount = 1;
  int maxRangeCapacity = 0;
  int minRange = 1;
  String? data;
  Future<FoodDetailsInfo>? response;

  final FoodDetailsRepositoryImpl getFoodDetails = FoodDetailsRepositoryImpl();

  @override
  void firstLoad() {
    loadFoodDetails(data ?? "");
  }

  @override
  void onListener() {}

  void increaseAmount() {
    if (amount == maxRangeCapacity) {
      amount == maxRangeCapacity;
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

  Future<FoodDetailsInfo>? loadFoodDetails(String foodName) {
    response = getFoodDetails.getFoodDetailsInfo(foodName);
    return response;
  }

  void fillOutData(int maxRange){
    maxRangeCapacity = maxRange;
  }
}
