import '../../../../common/base_controller.dart';
import '../../../../data/repositories_impl/food_details_repository_impl/food_details_repository_impl.dart';
import '../../../../domain/entities/food_info/food_details_info/food_details_info.dart';

class HomePageController extends BaseController {
  Future<List<FoodDetailsInfo>>? response;

  final FoodDetailsRepositoryImpl getFoodDetails = FoodDetailsRepositoryImpl();

  @override
  void firstLoad() {
    loadFoodList();
  }

  void addData() {
    showLoadingProgress();
    hideLoadingProgress();
  }

  @override
  void onListener() {}

  Future<List<FoodDetailsInfo>?>? loadFoodList() {
    response = getFoodDetails.getListFood();
    return response;
  }
}
