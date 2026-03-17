class BooksModel {
  const BooksModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final double price;
}
