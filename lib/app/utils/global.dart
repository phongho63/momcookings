import 'package:flutter/cupertino.dart';

import '../../data/network/constants.dart';
import '../../domain/entities/food_info/food_details_info/food_details_info.dart';

class Global {
  static String mToken = "";
  static bool isAppInForeground = true;
  static String mLang = "";
  static String appVersion = "";

  // color
  ///the app color
  static Map<String, String> mColors = {
    "red_1": "#E47272",
    "red_2": "#EA3838",
    "red_3": "#945959",
    "red_4": "#B66A6A",
    "red_5": "#E52A2D",
    "red_6": "#BC4343",
    "red_7": "#FFF3E8",
    "red_8": "#FB5D2B",
    "red_9": "#DB6060",
    "red_10": "#BB4343",
    "red_11": "#BB4A4A",
    "red_12": "#CF4040",
    "red_13": "#DB8F8F",
    "red_14": "#D75757",
    "blue_1": "#FF125C66",
    "blue_2": "#408289",
    "blue_3": "#B3125C66",
    "blue_4": "#FF214664",
    "blue_6": "#125C66",
    "blue_7": "#D8E6DB",
    "blue_8": "#387FEA",
    "blue_9": "#458FFF",
    "blue_10": "#E7F3FF",
    "blue_11": "#3D72DA",
    "blue_12": "#E5F6F6",
    "blue_13": "#198EFD",
    "blue_14": "#0D47A1",
    "blue_15": "#030E1E",
    "blue_16": "#030E1E",
    "blue_17": "#023179",
    "green": "#4CAF50",
    "green_2": "#125C66",
    "green_3": "#134E54",
    "green_4": "#2C9822",
    "green_5": "#4A7D21",
    "green_6": "#1C9B66",
    "green_7": "#3ACE64",
    "yellow_1": "#FFBA9100",
    "yellow_2": "#EA8338",
    "yellow_3": "#856D18",
    "yellow_4": "#C79C6B",
    "yellow_5": "#FFF5DD",
    "black_1": "#FF979AA0",
    "black_2": "#FF686868",
    "black_3": "#80000000",
    "black_4": "#29000000",
    "black_5": "#FF323232",
    "black_6": "#646464",
    "black_7": "#33000000",
    "black_8": "#FF0A1811",
    "black_9": "#0A1811",
    "black_10": "#313131",
    "gray_1": "#66FFFFFF",
    "gray_2": "#FF494949",
    "gray_3": "#B3646464",
    "gray_5": "#BFFFFFFF",
    "gray_6": "#CCFFFFFF",
    "gray_7": "#FFD3E9E8",
    "gray_8": "#E2E2E2",
    "gray_9": "#E5E5E5",
    "gray_10": "#FF7B827E",
    "gray_11": "#FFB6B6B6",
    "gray_12": "#636363",
    "gray_13": "#F1F1F1",
    "gray_14": "#D9D9D9",
    "gray_15": "#F8F8F8",
    "gray_16": "#C1C4C9",
    "brown_1": "#B8601F",
    "orange_1": "#FE724C",
    "white_1": "#D3D1D8",
    "white_2": "#FCFCFD",
  };

  static int mTimeClick = 0;
  static bool isAvailableToClick() {
    debugPrint("clicked ${DateTime.now().millisecondsSinceEpoch - mTimeClick}");
    if (DateTime.now().millisecondsSinceEpoch - mTimeClick > 1000) {
      mTimeClick = DateTime.now().millisecondsSinceEpoch;
      return true;
    }
    return false;
  }

// static String convertMedia(String path, int? width) {
//   if (width == null) {
//     debugPrint("Loaded path: " +
//         "${Constants.baseUrl}/services/media/api/v1/view/$path");
//     return "${Constants.baseUrl}/services/media/api/v1/view/$path";
//   }
//   debugPrint("Loaded path: " +
//       "${Constants.baseUrl}/services/media/api/v1/view/$path?width=$width");
//   return "${Constants.baseUrl}/services/media/api/v1/view/$path?width=$width";
// }

  static List<FoodDetailsInfo> sampleData = [
    FoodDetailsInfo(
        0,
        "Chè Đậu Ván",
        "20.000",
        "Hạt đậu ván già thường dùng để nấu chè (món ăn), ở Huế gọi là chè đậu ván. Ở một số vùng quê Việt Nam, lá đậu ván được dùng để nhuộm màu bánh chưng. Trong hạt đậu ván khô có chứa độc tố glucozit dưới dạng xyanua với nồng độ cao, do đó chỉ ăn được sau khi luộc hạt đậu trong một thời gian.",
        ["Đậu", "Nước dừa", "Nóng"],
        5,
        4.5),
    FoodDetailsInfo(
        1,
        "Chè Chuối",
        "20.000",
        "Chè chuối là món chè quê quen thuộc với những nguyên liệu vô cùng đơn giản, dễ kiếm nhưng lại mang một hương vị hấp dẫn khó quên. Để có thể thưởng thức món ăn này thường xuyên, bạn có thể học cách làm, sẽ không quá khó mà lại nhanh chóng. Đảm bảo, bạn sẽ có một món chè thơm ngon, bổ dưỡng chiêu đãi cả nhà.",
        ["Chuối", "Nước dừa", "Nóng"],
        3,
        5.0),
    FoodDetailsInfo(
        2,
        "Chè Đậu Đen",
        "20.000",
        "Chè đậu đen là một loại chè ngọt, có thể nấu loãng hoặc đặc sệt tùy sở thích mỗi người. Món ăn này vừa bổ dưỡng vừa thích hợp dùng để giải khát vào mùa hè nắng nóng. Cách chế biến khá đơn giản và bạn còn thể biến tấu, kết hợp với nhiều nguyên liệu khác để tạo nên nhiều công thức chè mới. Chúng ta cùng điểm qua một số tác dụng của đậu đen đối với sức khỏe con người.",
        ["Đậu", "Lạnh", "Nóng"],
        6,
        4.0),
    FoodDetailsInfo(
        3,
        "Chè Đậu Xanh",
        "20.000",
        "Đậu xanh có một nguồn gốc lịch sử đa dạng và phức tạp. Xuất hiện lần đầu tiên vào thời kỳ của triều đại Nguyễn, món chè này đã trải qua nhiều giai đoạn biến đổi để trở thành món ngon như chúng ta biết đến ngày nay. Xuất phát từ việc dùng đậu xanh, một loại cây trồng phổ biến trong nông nghiệp cổ đại Việt Nam. Đậu xanh đã trở thành một phần của bữa ăn hàng ngày và trong các dịp lễ hội đặc biệt.",
        ["Đậu", "Lạnh", "Nóng"],
        5,
        4.5),
    FoodDetailsInfo(
        4,
        "Chè Hạt Sen",
        "30.000",
        "Chè hạt sen vốn là một món ăn hoàng cung và rất được các vua chúa yêu thích. Món chè không chỉ có hương vị thơm ngon, mát lành mà còn có rất nhiều công dụng hỗ trợ cho sức khỏe như: Làm đẹp, chống lão hóa da, bồi bổ sức khỏe.",
        ["Đậu", "Đắng", "Nóng"],
        5,
        3.0),
    FoodDetailsInfo(
        5,
        "Chè Ba Màu",
        "40.000",
        "Chè ba màu là món chè đã in sâu vào trong kí ức tuổi thơ của nhiều người Việt Nam. Ly chè truyền thống với màu sắc cực  bắt mắt, vị ngon, ngọt mịn của các loại đậu quyện cùng nước cốt dừa béo ngậy, vị mát lạ miệng đến từ rau câu,... Tất cả tạo nên ly chè ba màu thật đặc biệt. Vào bếp và thực hiện những ly chè hấp dẫn này để cả gia đình mình cùng xua tan cái nắng hè nhé!",
        ["Đậu", "Ngọt", "Lạnh"],
        2,
        2.0),
  ];
}
