class GetBookModel {
  String? status;
  List<Books>? books;

  GetBookModel({this.status, this.books});

  GetBookModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  int? id;
  String? name;
  dynamic description;
  String? image;
  String? book;
  String? views;
  String? size;
  int? teacherId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;
  //String? ratesSumRate;
  int? ratesCount;
  Teacher? teacher;

  Books(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.book,
        this.views,
        this.size,
        this.teacherId,
        this.subjectId,
        this.createdAt,
        this.updatedAt,
    //    this.ratesSumRate,
        this.ratesCount,
        this.teacher});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    book = json['book'];
    views = json['views'];
    size = json['size'];
    teacherId = json['teacher_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
   // ratesSumRate = json['rates_sum_rate'];
    ratesCount = json['rates_count'];
    teacher =
    json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['book'] = this.book;
    data['views'] = this.views;
    data['size'] = this.size;
    data['teacher_id'] = this.teacherId;
    data['subject_id'] = this.subjectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
   // data['rates_sum_rate'] = this.ratesSumRate;
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
//  Null? phone;
  String? photo;
 // Null? address;
  int? rank;
  int? schoolId;
  int? subjectId;

  Teacher(
      {this.id,
        this.name,
        this.email,
        //this.phone,
        this.photo,
       // this.address,
        this.rank,
        this.schoolId,
        this.subjectId});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    //phone = json['phone'];
    photo = json['photo'];
   // address = json['address'];
    rank = json['rank'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    // data['phone'] = this.phone;
    data['photo'] = this.photo;
   // data['address'] = this.address;
    data['rank'] = this.rank;
    data['school_id'] = this.schoolId;
    data['subject_id'] = this.subjectId;
    return data;
  }
}