import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_project/app/assets/icon_assets.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import '../../../assets/image_assets.dart';
import '../../../utils/global.dart';
import 'food_details_controller.dart';

class FoodDetailsView extends View {
  const FoodDetailsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FoodDetailsView();
  }
}

class _FoodDetailsView
    extends BaseStateView<FoodDetailsView, FoodDetailsController> {
  _FoodDetailsView() : super(FoodDetailsController());
  FoodDetailsController? mFoodDetailsController;

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
    mFoodDetailsController = controller as FoodDetailsController;
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
                      child:
                          Image.asset(ImageAssets.imgFoodDetailBannerSample)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 20),
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
              const Text("Text: Chè đậu ván",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 28,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 13),
              Row(children: [
                SizedBox(
                  height: 17,
                  width: 17,
                  child: Image.asset(IconAssets.icRatingStar),
                ),
                const SizedBox(width: 9),
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text("4.5",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(width: 5)
              ]),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "20.000đ",
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
                        SizedBox(
                          height: 31,
                          width: 31,
                          child: Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: HexColor(Global
                                              .mColors['orange_1']
                                              .toString())))),
                              Center(
                                  child: Text("-",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 20,
                                          color: HexColor(Global
                                              .mColors['orange_1']
                                              .toString()))))
                            ],
                          ),
                        ),
                        const Text("1"),
                        SizedBox(
                          height: 31,
                          width: 31,
                          child: Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: HexColor(Global.mColors['orange_1']
                                          .toString()),
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              const Center(
                                  child: Text("+",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 20,
                                          color: Colors.white)))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Text(
                  "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder. Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder.", style: TextStyle(fontFamily: 'Roboto', fontSize: 15, color: Colors.black.withOpacity(0.5), height: 2))
            ],
          ),
        ));
  }
}
