import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import '../../../utils/global.dart';
import '../favorite_list/favorite_list_view.dart';
import '../home_page/home_page_view.dart';
import '../notification/notification_view.dart';
import '../product_inventory/product_inventory_view.dart';
import '../setting/setting_view.dart';
import 'main_controller.dart';

class MainView extends View {
  const MainView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainView();
  }
}

class _MainView extends BaseStateView<MainView, MainController> {
  _MainView() : super(MainController());

  MainController? mMainController;

  @override
  bool isInitialAppbar() {
    return false;
  }

  List<Widget>? tabs;

  onTapped(int index) {
    mMainController!.currentTabIndex = index;
    mMainController!.refreshUI();
  }

  @override
  void onStateCreated() {
    tabs = [
      const HomePageView(),
      const FavoriteListView(),
      const ProductInventoryView(),
      const NotificationView(),
      const SettingView()
    ];
  }

  void _onRefreshBottomNavigation() {
    mMainController?.refreshUI();
  }

  @override
  void onStateDestroyed() {}

  @override
  String appBarTitle() {
    return "";
  }

  @override
  Widget body(BuildContext context, BaseController controller) {
    return _body(controller);
  }

  Widget _body(BaseController controller) {
    mMainController = controller as MainController;
    return Stack(children: [
      tabs![mMainController!.currentTabIndex],
      MediaQuery.of(context).orientation == Orientation.portrait
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(
                    // sets the background color of the `BottomNavigationBar`
                    canvasColor: Colors.transparent,
                    // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                    primaryColor: Colors.transparent),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                      BoxShadow(
                      //offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.1), //edited
                    spreadRadius: 2,
                    blurRadius: 11  //edited
                )]
                  ),
                  height: 80,
                  child: BottomNavigationBar(
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    onTap: onTapped,
                    backgroundColor: Colors.transparent,
                    currentIndex: mMainController!.currentTabIndex,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: [
                      _tab(0, "assets/main_assets/ic_home", "Trang chủ"),
                      _tab(1, "assets/main_assets/ic_favorite",
                          "Yêu thích"),
                      _tab(2, "assets/main_assets/ic_product_inventory",
                          "Đơn hàng"),
                      _tab(3, "assets/main_assets/ic_notification", "Thông báo"),
                      _tab(4, "assets/main_assets/ic_setting", "Cài đặt")
                    ],
                  ),
                ),
              ),
            )
          : Container(),
      //     : Container(),
    ]);
  }

  BottomNavigationBarItem _tab(int index, String? imageAsset, String namePage) {
    int badgeNumber = -1;
    if (index == 0 || index == 1 || index == 3 || index == 4){
      badgeNumber = 0;
    } else {

      // Future implementation

      // badgeNumber = Global.totalNewItemsInCart.length;

    }
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageIcon(
                    imageAsset == "" ? null : AssetImage("${imageAsset!}.png"),
                    color: HexColor(Global.mColors["white_1"].toString()),
                    size: 22,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    namePage,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 9,
                      color: HexColor(Global.mColors["white_1"].toString()),
                    ),
                  )
                ],
              )),
          if (badgeNumber > 0)
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Center(
                  child: Text(
                    badgeNumber > 9 ? "9+" : badgeNumber.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
        ],
      ),
      activeIcon: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageIcon(
                    imageAsset == ""
                        ? null
                        : AssetImage("${imageAsset!}.png"),
                    color: HexColor(Global.mColors["orange_1"].toString()),
                    size: 24,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    namePage,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 9,
                      color: HexColor(Global.mColors["orange_1"].toString()),
                    ),
                  )
                ],
              )),
          if (badgeNumber > 0)
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Center(
                  child: Text(
                    badgeNumber > 9 ? "9+" : badgeNumber.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
        ],
      ),
      label: "",
    );
  }
}
