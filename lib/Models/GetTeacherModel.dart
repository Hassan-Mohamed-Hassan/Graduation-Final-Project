class GetTeacherModel {
  String? status;
  List<Teachers>? teachers;

  GetTeacherModel({this.status, this.teachers});

  GetTeacherModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['teachers'] != null) {
      teachers = <Teachers>[];
      json['teachers'].forEach((v) {
        teachers!.add(new Teachers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.teachers != null) {
      data['teachers'] = this.teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teachers {
  int? id;
  String? name;
  String? email;
  //String? phone;
  String? photo;
 // String? address;
  int? rank;
  int? schoolId;
  int? subjectId;
  Subject? subject;

  Teachers(
      {this.id,
        this.name,
        this.email,
        //this.phone,
        this.photo,
       // this.address,
        this.rank,
        this.schoolId,
        this.subjectId,
        this.subject});

  Teachers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  //  phone = json['phone'];
    photo = json['photo'];
   // address = json['address'];
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
   // data['phone'] = this.phone;
    data['photo'] = this.photo;
   // data['address'] = this.address;
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
  SubjectDetails? subjectdetails;

  Subject(
      {this.id,
        this.schoolId,
        this.subjectId,
        this.createdAt,
        this.updatedAt,
        this.subjectdetails});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subjectdetails =
    json['subject'] != null ? new SubjectDetails.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['subject_id'] = this.subjectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subjectdetails != null) {
      data['subject'] = this.subjectdetails!.toJson();
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