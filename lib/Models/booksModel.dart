class BooksModel {
  final int bookId;
  final String bookName;
  final String bookDescription;
  final String bookImage;
  final String bookMaker;
  final int bookViews;
  final int bookPages;
  final double bookRating;
  final DateTime bookHistory;

  BooksModel({
    required this.bookId,
    required this.bookName,
    required this.bookDescription,
    required this.bookImage,
    required this.bookMaker,
    required this.bookViews,
    required this.bookPages,
    required this.bookRating,
    required this.bookHistory,
  });
}

List<BooksModel> booksList = [
  BooksModel(
    bookId: 1,
    bookName: 'Eloquent JavaScript',
    bookImage: 'assets/book.png',
    bookMaker: 'Osama Elewa',
    bookViews: 500,
    bookPages: 482,
    bookRating: 4,
    bookHistory: DateTime.now(),
    bookDescription: 'this book guid you to learn the principle of coding with javascript and solving difficult problems in amazing way, this book is the beginning to be a great programer',
  ),

  BooksModel(
    bookId: 2,
    bookName: 'Eloquent JavaScript',
    bookImage: 'assets/book.png',
    bookMaker: 'Osama Elewa',
    bookViews: 500,
    bookPages: 482,
    bookRating: 4,
    bookHistory: DateTime.now(),
    bookDescription: 'this book guid you to learn the principle of coding with javascript and solving difficult problems in amazing way, this book is the beginning to be a great programer',
  ),

  BooksModel(
    bookId: 3,
    bookName: 'Eloquent JavaScript',
    bookImage: 'assets/book.png',
    bookMaker: 'Osama Elewa',
    bookViews: 500,
    bookPages: 482,
    bookRating: 4,
    bookHistory: DateTime.now(),
    bookDescription: 'this book guid you to learn the principle of coding with javascript and solving difficult problems in amazing way, this book is the beginning to be a great programer',
  ),

  BooksModel(
    bookId: 4,
    bookName: 'Eloquent JavaScript',
    bookImage: 'assets/book.png',
    bookMaker: 'Osama Elewa',
    bookViews: 500,
    bookPages: 482,
    bookRating: 4,
    bookHistory: DateTime.now(),
    bookDescription: 'this book guid you to learn the principle of coding with javascript and solving difficult problems in amazing way, this book is the beginning to be a great programer',
  ),

  BooksModel(
    bookId: 5,
    bookName: 'Eloquent JavaScript',
    bookImage: 'assets/book.png',
    bookMaker: 'Osama Elewa',
    bookViews: 500,
    bookPages: 482,
    bookRating: 4,
    bookHistory: DateTime.now(),
    bookDescription: 'this book guid you to learn the principle of coding with javascript and solving difficult problems in amazing way, this book is the beginning to be a great programer',
  ),
  BooksModel(
    bookId: 6,
    bookName: 'Eloquent JavaScript',
    bookImage: 'assets/book.png',
    bookMaker: 'Osama Elewa',
    bookViews: 500,
    bookPages: 482,
    bookRating: 4,
    bookHistory: DateTime.now(),
    bookDescription: 'this book guid you to learn the principle of coding with javascript and solving difficult problems in amazing way, this book is the beginning to be a great programer',
  ),
];
