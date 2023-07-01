class GetAbsenceSchoolTOTeacherModel {
  String? status;
  List<Teachers>? teachers;
  List<Absence>? absence;

  GetAbsenceSchoolTOTeacherModel({this.status, this.teachers, this.absence});

  GetAbsenceSchoolTOTeacherModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['teachers'] != null) {
      teachers = <Teachers>[];
      json['teachers'].forEach((v) {
        teachers!.add(new Teachers.fromJson(v));
      });
    }
    if (json['absence'] != null) {
      absence = <Absence>[];
      json['absence'].forEach((v) {
        absence!.add(new Absence.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.teachers != null) {
      data['teachers'] = this.teachers!.map((v) => v.toJson()).toList();
    }
    if (this.absence != null) {
      data['absence'] = this.absence!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teachers {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? address;
  int? rank;
  int? schoolId;
  int? subjectId;
  List<Absences>? absences;

  Teachers(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.photo,
        this.address,
        this.rank,
        this.schoolId,
        this.subjectId,
        this.absences});

  Teachers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    address = json['address'];
    rank = json['rank'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
    if (json['absences'] != null) {
      absences = <Absences>[];
      json['absences'].forEach((v) {
        absences!.add(new Absences.fromJson(v));
      });
    }
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
    if (this.absences != null) {
      data['absences'] = this.absences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Absences {
  int? id;
  int? teacherId;
  int? takeId;
  String? status;
  String? createdAt;
  String? updatedAt;

  Absences(
      {this.id,
        this.teacherId,
        this.takeId,
        this.status,
        this.createdAt,
        this.updatedAt});

  Absences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    takeId = json['take_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacher_id'] = this.teacherId;
    data['take_id'] = this.takeId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Absence {
  int? id;
  int? schoolId;
  String? createdAt;
  String? updatedAt;

  Absence({this.id, this.schoolId, this.createdAt, this.updatedAt});

  Absence.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}