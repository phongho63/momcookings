import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_project/app/assets/icon_assets.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import '../../../../domain/entities/food_info/food_details_info/food_details_info.dart';
import '../../../assets/image_assets.dart';
import '../../../utils/global.dart';
import '../../../utils/pages.dart';
import '../food_details/food_details_view.dart';
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
  HomePageController? _controller;

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
    _controller = controller as HomePageController;
    return FutureBuilder<List<FoodDetailsInfo>>(
        future: _controller?.response,
        builder: (context, AsyncSnapshot<List<FoodDetailsInfo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SizedBox(
                      height: (Platform.isAndroid)
                          ? MediaQuery.of(context).size.height * 1.25
                          : MediaQuery.of(context).size.height * 1.05,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 105),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              "Chào mừng đến",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              "Quán Chè Mụ Tuyệch",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                  color: HexColor(
                                      Global.mColors['orange_1'].toString())),
                            ),
                          ),
                          const SizedBox(height: 19),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: _searchBar()),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Chè hiện có",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text("Xem tất cả >>",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 13,
                                        color: Colors.black.withOpacity(0.7)))
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 235,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data?.length ?? 1,
                              itemBuilder: (context, index) {
                                return _featuredItems(index, snapshot.data!,
                                    snapshot.data?.length ?? 1);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(width: 15);
                              },
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              "Chè nổi tiếng",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 235,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data?.length ?? 1,
                              itemBuilder: (context, index) {
                                return _featuredItems(index, snapshot.data!,
                                    snapshot.data?.length ?? 1);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(width: 15);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const SizedBox();
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
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
      child: TextField(
        cursorColor: Colors.black,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        onChanged: (value) {},
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.only(top: 2),
          prefixIcon: Container(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              IconAssets.icSearch,
              width: 24,
              height: 24,
              color: Colors.black,
            ),
          ),
          prefixIconConstraints:
              const BoxConstraints(maxWidth: 32, maxHeight: 24),
          hintText: "Tìm kiếm...",
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.2),
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _featuredItems(
      int index, List<FoodDetailsInfo> listResponse, int maxLength) {
    return InkWell(
      onTap: () {
        pushScreen(Pages.foodDetails,
            arguments: {foodItemParam: listResponse[index].foodId});
      },
      child: Container(
          width: 266,
          height: 229,
          margin: (index == 0) ? const EdgeInsets.only(left: 25) : (index == maxLength - 1) ? const EdgeInsets.only(right: 25) : null,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: Colors.black.withOpacity(0.2), width: 1)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 135,
              width: 266,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.asset(ImageAssets.imgSampleFoodBanner,
                          fit: BoxFit.fill, width: 266)),
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
                                  TextSpan(
                                      text: listResponse[index].foodRating,
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                  WidgetSpan(
                                      child: Container(
                                          height: 14,
                                          width: 15,
                                          padding:
                                              const EdgeInsets.only(bottom: 3),
                                          margin:
                                              const EdgeInsets.only(left: 3),
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
                    listResponse[index].foodName,
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
                      const Text("Giao hàng miễn phí",
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
                      const Text("10-15 phút",
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
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          height: 22,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: Center(
                            child: Text(
                                listResponse[index].foodTags[0].toUpperCase(),
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5))),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          height: 22,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: Center(
                            child: Text(
                                listResponse[index].foodTags[1].toUpperCase(),
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5))),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          height: 22,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: Center(
                            child: Text(
                                listResponse[index].foodTags[2].toUpperCase(),
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5))),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ])),
    );
  }
}
