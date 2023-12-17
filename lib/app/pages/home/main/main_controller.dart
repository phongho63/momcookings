import '../../../../common/base_controller.dart';
import '../../../utils/global.dart';

class MainController extends BaseController {
  int currentTabIndex = 0;

  @override
  void firstLoad() {}

  @override
  void onListener() {
    if (Global.totalNewItemsInCart.isNotEmpty) {
      refreshUI();
    }
  }
}
