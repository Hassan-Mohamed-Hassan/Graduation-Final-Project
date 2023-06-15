
class Book {
  int id;
  String name;
  String? description;
  String image;
  String book;
  String views;
  String size;
  int teacherId;
  int subjectId;
  String createdAt;
  String updatedAt;
  var ratesSumRate;
  int ratesCount;
  int studentRate;
  Teacher teacher;

  Book({
    required this.id,
    required this.name,
    this.description,
    required this.image,
    required this.book,
    required this.views,
    required this.size,
    required this.teacherId,
    required this.subjectId,
    required this.createdAt,
    required this.updatedAt,
    required this.ratesSumRate,
    required this.ratesCount,
    required this.studentRate,
    required this.teacher,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      book: json['book'],
      views: json['views'],
      size: json['size'],
      teacherId: json['teacher_id'],
      subjectId: json['subject_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      ratesSumRate: json['rates_sum_rate'],
      ratesCount: json['rates_count'],
      studentRate: json['studentRate'],
      teacher: Teacher.fromJson(json['teacher']),
    );
  }
}

class Teacher {
  int id;
  String name;

  Teacher({
    required this.id,
    required this.name,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Books {
  String status;
  List<Book> books;

  Books({
    required this.status,
    required this.books,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    var bookList = json['books'] as List;
    List<Book> books =
    bookList.map((book) => Book.fromJson(book)).toList();

    return Books(
      status: json['status'],
      books: books,
    );
  }
}