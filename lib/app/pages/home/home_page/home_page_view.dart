import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import 'home_page_controller.dart';

class HomePageView extends View {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageView();
  }
}

class _HomePageView extends BaseStateView<HomePageView, HomePageController> {
  _HomePageView() : super(HomePageController());
  HomePageController? mHomePageController;

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
    mHomePageController = controller as HomePageController;
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            "What would you like to order",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
