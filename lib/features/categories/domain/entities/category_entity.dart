class CategoryEntity {
  final int id;
  final String name;
  final String slug;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });
}
