class Book {
  final String id;
  final String title;
  final String? subtitle;
  final String? publisher;
  final int? publishedYear;
  final List<String> authors;
  final String? description;
  final String thumbnail;

  Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.publisher,
    required this.publishedYear,
    required this.authors,
    required this.description,
    required this.thumbnail
  });
}