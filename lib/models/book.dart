class Book {
  final String imagePath;
  final String title;
  final String author;
  final String description;
  final double price;
  final int rating;
  final int reviewCount;

  Book({
    required this.imagePath,
    required this.title,
    required this.author,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
  });

  // Override equality and hashCode to use Book as Map key (important!)
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Book &&
        other.title == title &&
        other.author == author; // Add more fields if needed
  }

  @override
  int get hashCode => title.hashCode ^ author.hashCode;
}