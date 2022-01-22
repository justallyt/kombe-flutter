// ignore_for_file: unnecessary_null_comparison

class Item {
  String name;
  String imagePath;
  int discountPercent;
  double originalPrice;
  double rating;

  Item({
    this.discountPercent = 0,
    required this.name,
    required this.imagePath,
    required this.originalPrice,
    required this.rating,
    
  });

  double get price {
    return discountPercent != null
        ? (originalPrice = (originalPrice * discountPercent / 100))
        : originalPrice;
  }

  static String format(double price) {
    String money = price.toStringAsFixed(2);
    return '\$$money';
  }
}
