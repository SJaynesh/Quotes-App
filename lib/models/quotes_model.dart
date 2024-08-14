// Modal Class

class QuotesModel {
  // Attributes
  final String quotes;
  final String author;
  final String category;

  // Parameterized Constructor
  QuotesModel({
    required this.quotes,
    required this.author,
    required this.category,
  });

  // Factory Constructor
  factory QuotesModel.fromMap({required Map data}) {
    return QuotesModel(
      quotes: data['quote'],
      author: data['author'],
      category: data['category'],
    );
  }
}
