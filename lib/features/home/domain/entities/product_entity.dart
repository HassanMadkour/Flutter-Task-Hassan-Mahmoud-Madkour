class ProductEntity {
  final String name;
  final double price;
  final double oldPrice;
  final int soldNumber;
  final String image;

  ProductEntity({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.soldNumber,
    required this.image,
  });

  String get solidNumberInK {
    if (soldNumber >= 1000 && soldNumber < 1000000) {
      double value = soldNumber / 1000;
      return "${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}k";
    } else if (soldNumber >= 1000000) {
      double value = soldNumber / 1000000;
      return "${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}M";
    } else {
      return soldNumber.toString();
    }
  }

  String priceWithCommaAfter3Digits(double price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
