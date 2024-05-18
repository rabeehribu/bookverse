
//model/add_book_model.dart
class AddBooksPubModel {
  String bookId;
  String? imageURL;
  String bookName;
  String authorName;
  String? category;
  String bookRate;
  String aboutBooks;


  AddBooksPubModel({
    required this.bookId,
    required this.imageURL,
    required this.bookName,
    required this.authorName,
    this.category,
    required this.bookRate,
    required this.aboutBooks,

  });

  factory AddBooksPubModel.fromMap(Map<String, dynamic> map) {
    return AddBooksPubModel(
      bookId: map['bookId'],
      imageURL: map['imageURL'],
      bookName: map['bookName'],
      authorName: map['authorName'],
      category: map['category'],
      bookRate: map['bookRate'],
      aboutBooks: map['aboutBooks'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'imageURL': imageURL,
      'bookName': bookName,
      'category': category,
      'bookRate': bookRate,
      'aboutBooks': aboutBooks,
      'authorName': authorName,

    };
  }
}
