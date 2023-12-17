import '../../../../common/base_controller.dart';
import '../../../../domain/entities/food_info/food_details_info/food_details_info.dart';
import '../../../utils/global.dart';

class HomePageController extends BaseController {
  List<FoodDetailsInfo> listData = [];


  @override
  void firstLoad() {
    addData();
  }

  void addData() {
    showLoadingProgress();
    listData.addAll(Global.sampleData);
    hideLoadingProgress();
  }

  @override
  void onListener() {}
}
