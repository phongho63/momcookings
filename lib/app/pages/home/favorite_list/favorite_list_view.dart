import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import 'favorite_list_controller.dart';

class FavoriteListView extends View {
  const FavoriteListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FavoriteListView();
  }
}

class _FavoriteListView extends BaseStateView<FavoriteListView, FavoriteListController> {
  _FavoriteListView() : super(FavoriteListController());
  FavoriteListController? mFavoriteListController;

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
    mFavoriteListController = controller as FavoriteListController;
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text(
            "Favorite list Page",
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
