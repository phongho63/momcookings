import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_project/app/assets/icon_assets.dart';
import 'package:personal_project/app/utils/module_utils.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import '../../../utils/global.dart';
import '../../../utils/pages.dart';
import 'product_inventory_controller.dart';

class ProductInventoryView extends View {
  const ProductInventoryView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductInventoryView();
  }
}

class _ProductInventoryView
    extends BaseStateView<ProductInventoryView, ProductInventoryController> {
  _ProductInventoryView() : super(ProductInventoryController());
  ProductInventoryController? mProductInventoryController;

  @override
  bool isInitialAppbar() {
    return true;
  }

  @override
  String appBarTitle() {
    return "Đơn hàng";
  }

  @override
  bool isHideBackButton() {
    return true;
  }

  @override
  Widget body(BuildContext context, BaseController controller) {
    mProductInventoryController = controller as ProductInventoryController;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: HexColor(Global.mColors['white_3'].toString())),
                    borderRadius: BorderRadius.circular(50)),
                child: SegmentedTabControl(
                    radius: const Radius.circular(50),
                    backgroundColor:
                        HexColor(Global.mColors['white_2'].toString()),
                    indicatorColor:
                        HexColor(Global.mColors['orange_1'].toString()),
                    tabTextColor:
                        HexColor(Global.mColors['orange_1'].toString()),
                    selectedTabTextColor:
                        HexColor(Global.mColors['white_2'].toString()),
                    splashHighlightColor:
                        HexColor(Global.mColors['orange_1'].toString())
                            .withOpacity(0.2),
                    splashColor: HexColor(Global.mColors['orange_1'].toString())
                        .withOpacity(0.2),
                    squeezeIntensity: 2,
                    height: 55,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    textStyle: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    tabs: [
                      SegmentTab(
                          label: 'Đơn hàng đang xử lý',
                          color:
                              HexColor(Global.mColors['orange_1'].toString())),
                      SegmentTab(
                          label: 'Lịch sử đơn hàng',
                          color:
                              HexColor(Global.mColors['orange_1'].toString())),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 65),
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _tabUpcomingContent(),
                  _tabHistoryContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabUpcomingContent() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
      color: HexColor(Global.mColors['white_2'].toString()),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: mProductInventoryController!.data!.length,
        itemBuilder: (context, index) {
          return _upcomingContent(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
      ),
    );
  }

  Widget _upcomingContent(int index) {
    return Container(
      height: 233,
      width: 323,
      padding: const EdgeInsets.all(18),
      margin: (index == mProductInventoryController!.data!.length - 1)
          ? const EdgeInsets.only(bottom: 20)
          : null,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: HexColor(Global.mColors['white_2'].toString()),
          border: Border.all(color: Colors.black.withOpacity(0.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text("Logo"))),
              const SizedBox(width: 18),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text("20 Jun, 10:30",
                        style: TextStyle(fontFamily: 'Roboto')),
                    const SizedBox(width: 7),
                    SizedBox(
                        height: 5,
                        width: 5,
                        child: Image.asset(IconAssets.icDotSeparator)),
                    const SizedBox(width: 8),
                    Text(
                        "${mProductInventoryController?.data?[index].amount ?? 0} Món",
                        style: const TextStyle(fontFamily: 'Roboto'))
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                    mProductInventoryController?.data?[index].productName ?? "",
                    style: const TextStyle(fontFamily: 'Roboto')),
                const SizedBox(height: 7),
                Row(children: [
                  SizedBox(
                    height: 7,
                    width: 7,
                    child: Image.asset(IconAssets.icDotSeparator,
                        color: Colors.orange.shade600),
                  ),
                  const SizedBox(width: 5),
                  Text("Đang được xử lý",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.orange.shade600,
                          fontFamily: 'Roboto'))
                ])
              ]),
              const Spacer(),
              Text("#${mProductInventoryController?.data?[index].id}",
                  style: const TextStyle(fontFamily: 'Roboto')),
            ],
          ),
          const SizedBox(height: 3),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Divider(color: Colors.black.withOpacity(0.5))),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Thời gian giao",
                      style: TextStyle(fontSize: 12, fontFamily: 'Roboto')),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          "${mProductInventoryController?.data?[index].estimateTime.toString()}",
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto')),
                      const SizedBox(width: 3),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 3.0),
                        child: Text("phút"),
                      )
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Tổng tiền",
                      style: TextStyle(fontSize: 12, fontFamily: 'Roboto')),
                  const SizedBox(height: 5),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Text(
                          formattedMoney(mProductInventoryController
                              ?.data?[index].totalPrice
                              .round()),
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Roboto',
                              color: HexColor(
                                  Global.mColors['orange_1'].toString()))))
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Center(
            child: SizedBox(
              width: 323,
              child: Row(children: [
                InkWell(
                  onTap: () {
                    debugPrint("You pressed cancel");
                    pushScreen(Pages.register);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(Global.mColors["white_2"].toString()),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3))),
                    width: 147,
                    height: 43,
                    child: const Center(
                        child: Text("Huỷ đơn",
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'Roboto'))),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    debugPrint("You pressed Track Order");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(Global.mColors["orange_1"].toString())),
                    width: 147,
                    height: 43,
                    child: const Center(
                        child: Text("Theo dõi đơn",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Roboto'))),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabHistoryContent() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
      color: HexColor(Global.mColors['white_2'].toString()),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: mProductInventoryController!.data!.length,
        itemBuilder: (context, index) {
          return _historyContent(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
      ),
    );
  }

  Widget _historyContent(int index) {
    return Container(
      height: 201,
      width: 323,
      padding: const EdgeInsets.all(18),
      margin: (index == mProductInventoryController!.data!.length - 1)
          ? const EdgeInsets.only(bottom: 20)
          : null,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: HexColor(Global.mColors['white_2'].toString()),
          border: Border.all(color: Colors.black.withOpacity(0.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text("Logo"))),
              const SizedBox(width: 18),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text("20 Jun, 10:30",
                        style: TextStyle(fontFamily: 'Roboto')),
                    const SizedBox(width: 7),
                    SizedBox(
                        height: 5,
                        width: 5,
                        child: Image.asset(IconAssets.icDotSeparator)),
                    const SizedBox(width: 8),
                    Text(
                        "${mProductInventoryController?.data?[index].amount ?? 0} Món",
                        style: const TextStyle(fontFamily: 'Roboto'))
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                    mProductInventoryController?.data?[index].productName ?? "",
                    style: const TextStyle(fontFamily: 'Roboto')),
                const SizedBox(height: 7),
                Row(children: [
                  SizedBox(
                    height: 7,
                    width: 7,
                    child: Image.asset(IconAssets.icDotSeparator,
                        color: Colors.green),
                  ),
                  const SizedBox(width: 5),
                  const Text("Đã hoàn tất",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontFamily: 'Roboto'))
                ])
              ]),
              const Spacer(),
              Text("#${mProductInventoryController?.data?[index].id}",
                  style: const TextStyle(fontFamily: 'Roboto')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text("Tổng tiền",
                  style: TextStyle(fontSize: 14, fontFamily: 'Roboto')),
              const Spacer(),
              Text(
                  formattedMoney(mProductInventoryController
                      ?.data?[index].totalPrice
                      .round()),
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Roboto',
                      color: HexColor(Global.mColors["orange_1"].toString())))
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: 295,
              child: Row(children: [
                InkWell(
                  onTap: () {
                    debugPrint("Bạn đã nhấn Đánh Giá");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(Global.mColors["white_2"].toString()),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3))),
                    width: 135,
                    height: 43,
                    child: const Center(
                        child: Text("Đánh giá",
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'Roboto'))),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    debugPrint("Bạn đã nhấn Đặt Lại");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(Global.mColors["orange_1"].toString())),
                    width: 135,
                    height: 43,
                    child: const Center(
                        child: Text("Đặt lại",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Roboto'))),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
