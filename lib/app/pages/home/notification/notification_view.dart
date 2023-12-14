import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import 'notification_controller.dart';

class NotificationView extends View {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotificationView();
  }
}

class _NotificationView extends BaseStateView<NotificationView, NotificationController> {
  _NotificationView() : super(NotificationController());
  NotificationController? mNotificationController;

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
    mNotificationController = controller as NotificationController;
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text(
            "Notification page",
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
