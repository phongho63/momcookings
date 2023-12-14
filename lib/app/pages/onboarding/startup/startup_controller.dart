import '../../../../common/base_controller.dart';
import '../../../utils/pages.dart';
import '../../../utils/shared_preferences.dart';

class StartupController extends BaseController {

  bool isShowStartButton = false;

  @override
  void onResumed() {}

  @override
  void firstLoad() {}

  void goToLogin() async {
    bool? firstInstallApp = await SharedPreferencesHelper().getBoolValue(
        SharedData.APP_FIRST_INSTALL.toString(),
        defaultValue: true);
    if (firstInstallApp) {
      SharedPreferencesHelper()
          .setBoolValue(SharedData.APP_FIRST_INSTALL.toString(), false);
      isShowStartButton = true;
      // isLoadingData = false;
      refreshUI();
    } else {
      //view.pushScreen(Pages.onboardingHome, isAllowBack: false);
    }
  }
}
