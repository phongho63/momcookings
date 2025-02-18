import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../../common/base_controller.dart';
import '../../../../common/base_state_view.dart';
import 'product_inventory_controller.dart';

class ProductInventoryView extends View {
  const ProductInventoryView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductInventoryView();
  }
}

class _ProductInventoryView extends BaseStateView<ProductInventoryView, ProductInventoryController> {
  _ProductInventoryView() : super(ProductInventoryController());
  ProductInventoryController? mProductInventoryController;

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
    mProductInventoryController = controller as ProductInventoryController;
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text(
            "Product inventory Page",
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
