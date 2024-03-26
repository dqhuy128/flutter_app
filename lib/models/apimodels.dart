class ProductModels {
  final int id;
  final String title;
  final String? description;
  final String? category;

  ProductModels({
    required this.id,
    required this.title,
    this.description,
    this.category,
  });
}
