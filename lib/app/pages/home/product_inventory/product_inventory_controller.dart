import '../../../../common/base_controller.dart';

class ProductInventoryController extends BaseController {
  List<UpcomingProduct>? data;

  @override
  void firstLoad() {
    data = [
      UpcomingProduct(
        id: "1",
        amount: 5,
        productName: "Chè Đậu Đen",
        estimateTime: 25,
        totalPrice: 20000
      ),
      UpcomingProduct(
        id: "2",
        amount: 9,
        productName: "Chè Đậu Xanh",
        estimateTime: 5,
        totalPrice: 50000
      ),
      UpcomingProduct(
        id: "3",
        amount: 2,
        productName: "Chè Thập Cẩm",
        estimateTime: 15,
        totalPrice: 30000
      ),
      UpcomingProduct(
        id: "4",
        amount: 10,
        productName: "Chè Mỹ",
        estimateTime: 60,
        totalPrice: 70000
      ),
      UpcomingProduct(
        id: "5",
        amount: 8,
        productName: "Chè Chuối",
        estimateTime: 30,
        totalPrice: 90000
      ),
    ];
  }

  @override
  void onListener() {}
}

class UpcomingProduct {
  String id = "";
  int amount = 0;
  String productName = "";
  int estimateTime = 0;
  double totalPrice = 0.0;

  UpcomingProduct(
      {required this.id,
      required this.amount,
      required this.productName,
      required this.estimateTime,
      required this.totalPrice});
}
