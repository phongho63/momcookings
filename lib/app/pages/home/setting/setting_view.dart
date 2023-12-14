import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import 'setting_controller.dart';

class SettingView extends View {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingView();
  }
}

class _SettingView extends BaseStateView<SettingView, SettingController> {
  _SettingView() : super(SettingController());
  SettingController? mSettingController;

  @override
  bool isInitialAppbar() {
    return false;
  }

  @override
  String appBarTitle() {
    return "";
  }

  @override
  bool isHideBackButton() {
    return true;
  }

  @override
  Widget body(BuildContext context, BaseController controller) {
    mSettingController = controller as SettingController;
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text(
            "Favorite list Page",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
