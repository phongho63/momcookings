import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_project/app/assets/icon_assets.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import '../../../../domain/entities/food_info/food_details_info/food_details_info.dart';
import '../../../assets/image_assets.dart';
import '../../../utils/global.dart';
import 'food_details_controller.dart';

const foodItemParam = 'foodItemParam';

class FoodDetailsView extends View {
  final FoodDetailsInfo? foodItem;
  const FoodDetailsView({Key? key, this.foodItem}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FoodDetailsView(foodItem);
  }
}

class _FoodDetailsView
    extends BaseStateView<FoodDetailsView, FoodDetailsController> {
  _FoodDetailsView(foodItemData)
      : super(FoodDetailsController(data: foodItemData));
  FoodDetailsController? _controller;

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
    _controller = controller as FoodDetailsController;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(ImageAssets.imgFoodDetailBannerSample)),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          onBack();
                        },
                        child: Container(
                          height: 38,
                          width: 38,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(IconAssets.icBack)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 22),
            Text(_controller!.data!.foodName,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 28,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 3),
            Row(children: [
              SizedBox(
                height: 17,
                width: 17,
                child: Image.asset(IconAssets.icRatingStar),
              ),
              const SizedBox(width: 9),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text("${_controller!.data!.foodRating}",
                    style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 5)
            ]),
            const SizedBox(height: 10),
            Text('Số lượng còn lại: ${_controller!.data!.foodRange}',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.3))),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_controller!.data!.foodPrice} đ",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 31,
                      fontWeight: FontWeight.w600,
                      color: HexColor(Global.mColors['orange_1'].toString())),
                ),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _controller!.decreaseAmount();
                        },
                        child: SizedBox(
                          height: 31,
                          width: 31,
                          child: Stack(
                            children: [
                              Container(
                                  decoration: (_controller!.amount ==
                                          _controller!.minRange)
                                      ? BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: HexColor(Global
                                                  .mColors['orange_1']
                                                  .toString())))
                                      : BoxDecoration(
                                          color: HexColor(Global
                                              .mColors['orange_1']
                                              .toString()),
                                          borderRadius:
                                              BorderRadius.circular(100))),
                              Center(
                                  child: Text("-",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 20,
                                          color: (_controller!.amount ==
                                                  _controller!.minRange)
                                              ? HexColor(Global
                                                  .mColors['orange_1']
                                                  .toString())
                                              : Colors.white)))
                            ],
                          ),
                        ),
                      ),
                      Text("${_controller!.amount}"),
                      InkWell(
                        onTap: () {
                          _controller!.increaseAmount();
                        },
                        child: SizedBox(
                          height: 31,
                          width: 31,
                          child: Stack(
                            children: [
                              Container(
                                  decoration: (_controller!.amount ==
                                          _controller!.maxRange)
                                      ? BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: HexColor(Global
                                                  .mColors['orange_1']
                                                  .toString())))
                                      : BoxDecoration(
                                          color: HexColor(Global
                                              .mColors['orange_1']
                                              .toString()),
                                          borderRadius:
                                              BorderRadius.circular(100))),
                              Center(
                                  child: Text("+",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 20,
                                          color: (_controller!.amount ==
                                                  _controller!.maxRange)
                                              ? HexColor(Global
                                                  .mColors['orange_1']
                                                  .toString())
                                              : Colors.white)))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 25),
            Text(_controller!.data!.foodDescription,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                    height: 2))
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SizedBox(
          height: 70,
          child: Center(
            child: Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                  color: HexColor(Global.mColors['orange_1'].toString()),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text("Thêm vào giỏ hàng".toUpperCase(), style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
