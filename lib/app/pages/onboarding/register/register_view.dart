import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:personal_project/app/pages/onboarding/register/register_controller.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';

class RegisterView extends View {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterView();
  }
}

class _RegisterView extends BaseStateView<RegisterView, RegisterController> {
  _RegisterView() : super(RegisterController());
  RegisterController? _controller;

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
    _controller = controller as RegisterController;

    return const Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(child: Center(child: Text("hi"))),
    );
  }
}
