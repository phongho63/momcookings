class FoodDetailsInfo {
  int foodId = -1;
  String foodName = "";
  String foodPrice = "";
  String foodDescription = "";
  List<String> foodTags = [];
  int foodRange = 0;
  double foodRating = 0.0;

  FoodDetailsInfo.buildDefault();
  FoodDetailsInfo(
      this.foodId,
      this.foodName,
      this.foodPrice,
      this.foodDescription,
      this.foodTags,
      this.foodRange,
      this.foodRating
      );
}