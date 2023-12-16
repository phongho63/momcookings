import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_project/app/assets/icon_assets.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import '../../../assets/image_assets.dart';
import '../../../utils/global.dart';
import '../../../widgets/button_view.dart';
import '../../../widgets/gradient_text.dart';
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
    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
                color: HexColor(Global.mColors["orange_1"].toString()))),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 210,
                  height: 147,
                  child: Image.asset(IconAssets.icFoodLogo)),
              const Text("Food Hub",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ],
          ),
        ),
      ]),
    );
  }
}
