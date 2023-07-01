class AddTeacherModel {
  String? status;
  String? message;
  List<Teacher>? teacher;

  AddTeacherModel({this.status, this.message, this.teacher});

  AddTeacherModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['teacher'] != null) {
      teacher = <Teacher>[];
      json['teacher'].forEach((v) {
        teacher!.add(new Teacher.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teacher {
  int? id;
  String? name;
  String? email;
  Null? phone;
  String? photo;
  Null? address;
  int? rank;
  int? schoolId;
  int? subjectId;
  Subject? subject;

  Teacher(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.photo,
        this.address,
        this.rank,
        this.schoolId,
        this.subjectId,
        this.subject});

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
    subject =
    json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
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
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    return data;
  }
}

class Subject {
  int? id;
  int? schoolId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;
  SubjectDetails? subjectDetails;

  Subject(
      {this.id,
        this.schoolId,
        this.subjectId,
        this.createdAt,
        this.updatedAt,
        this.subjectDetails});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subjectDetails =
    json['subjectDetails'] != null ? new SubjectDetails.fromJson(json['subjectDetails']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['subject_id'] = this.subjectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subjectDetails != null) {
      data['subject'] = this.subjectDetails!.toJson();
    }
    return data;
  }
}

class SubjectDetails {
  int? id;
  String? name;

  SubjectDetails({this.id, this.name});

  SubjectDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}