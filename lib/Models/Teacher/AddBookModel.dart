class AddBookModel {
  String? status;
  String? message;
  Book? book;

  AddBookModel({this.status, this.message, this.book});

  AddBookModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    book = json['book'] != null ? new Book.fromJson(json['book']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.book != null) {
      data['book'] = this.book!.toJson();
    }
    return data;
  }
}

class Book {
  String? name;
  String? image;
  String? book;
  int? teacherId;
  int? subjectId;
  String? size;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? ratesSumRate;
  int? ratesCount;
  Teacher? teacher;

  Book(
      {this.name,
        this.image,
        this.book,
        this.teacherId,
        this.subjectId,
        this.size,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.ratesSumRate,
        this.ratesCount,
        this.teacher});

  Book.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    book = json['book'];
    teacherId = json['teacher_id'];
    subjectId = json['subject_id'];
    size = json['size'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    ratesSumRate = json['rates_sum_rate'];
    ratesCount = json['rates_count'];
    teacher =
    json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['book'] = this.book;
    data['teacher_id'] = this.teacherId;
    data['subject_id'] = this.subjectId;
    data['size'] = this.size;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['rates_sum_rate'] = this.ratesSumRate;
    data['rates_count'] = this.ratesCount;
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    return data;
  }
}

class Teacher {
  int? id;
  String? name;
  String? email;
  dynamic phone;
  String? photo;
  dynamic address;
  int? rank;
  int? schoolId;
  int? subjectId;

  Teacher(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.photo,
        this.address,
        this.rank,
        this.schoolId,
        this.subjectId});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    address = json['address'];
    rank = json['rank'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['address'] = this.address;
    data['rank'] = this.rank;
    data['school_id'] = this.schoolId;
    data['subject_id'] = this.subjectId;
    return data;
  }
}