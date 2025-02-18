import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_project/app/assets/icon_assets.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import '../../../assets/image_assets.dart';
import '../../../utils/global.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 105),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "What chè would you like to order",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 19),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: _searchBar()),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Featured Chè",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Text("View all")
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 235,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return _featuredItems(index);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 15);
                    },
                  ),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Popular Chè",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: const Text("List view here"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.872,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 19),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.1), width: 2),
            borderRadius: BorderRadius.circular(10),
            color: HexColor(Global.mColors["white_2"].toString())),
        child: const Text(
          "Search bar here",
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w400),
        ));
  }

  Widget _featuredItems(int index) {
    return Container(
        width: 266,
        height: 229,
        margin: (index == 0) ? const EdgeInsets.only(left: 25) : null,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black.withOpacity(0.2), width: 1)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 135,
            child: Stack(
              children: [
                Image.asset(ImageAssets.imgFoodSample),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 29,
                        width: 52,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                const TextSpan(
                                    text: '4.5',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                                WidgetSpan(
                                    child: Container(
                                        height: 14,
                                        width: 15,
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        margin: const EdgeInsets.only(left: 3),
                                        child: Image.asset(
                                            IconAssets.icRatingStar))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Image.asset(IconAssets.icSaveFavorite)
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chè ${index + 1}",
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    SizedBox(
                      width: 14,
                      height: 12,
                      child: Image.asset(IconAssets.icDeliveryGuy),
                    ),
                    const SizedBox(width: 4),
                    const Text("Free delivery",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                    const SizedBox(width: 17),
                    SizedBox(
                      width: 11,
                      height: 13,
                      child: Image.asset(IconAssets.icEstimateClock),
                    ),
                    const SizedBox(width: 4),
                    const Text("10-15 mins",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 226,
                  height: 22,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _tagItems(index);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 6);
                    },
                  ),
                )
              ],
            ),
          ),
        ]));
  }

  Widget _tagItems(int index) {
    return Container(
      width: 54,
      height: 22,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Center(
        child: Text("Type: ${index + 1}".toUpperCase(),
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.5))),
      ),
    );
  }
}
