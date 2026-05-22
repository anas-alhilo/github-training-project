class TrendingItem {
  final String image;
  final String title;
  final double price;
  bool isFavorite;
  TrendingItem({
    required this.image,
    required this.title,
    required this.price,
    this.isFavorite = false,
  });
}
