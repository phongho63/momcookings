import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import '../../../utils/global.dart';
import '../../../widgets/button_view.dart';
import '../../onboarding/startup/startup_controller.dart';

class StartupView extends View {
  StartupView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StartupView();
  }
}

class _StartupView extends BaseStateView<StartupView, StartupController> {
  _StartupView() : super(StartupController());

  @override
  bool isInitialAppbar() {
    return false;
  }

  @override
  String appBarTitle() {
    return "";
  }

  @override
  Widget body(BuildContext context, BaseController controller) {
    StartupController startupController = controller as StartupController;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("Chè review",style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: HexColor(Global.mColors["black_5"].toString()),
          ),),
        ),
        bottomNavigationBar: MaluButton(
          color: HexColor(Global.mColors["blue_1"].toString()),
          text: "Bắt đầu",
          buttonHeight: 50,
          onPressEvent: () {
            // pushScreen(Pages.onboardingHome,
            //     isAllowBack: false);
          },
        ),
      ),
    );
  }
}
