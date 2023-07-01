class GetAnnouncedModel {
  String? status;
  List<Rooms>? rooms;

  GetAnnouncedModel({this.status, this.rooms});

  GetAnnouncedModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  int? id;
  String? name;
  int? schoolId;
  int? roomId;
  String? createdAt;
  String? updatedAt;
  Room? room;

  Rooms(
      {this.id,
        this.name,
        this.schoolId,
        this.roomId,
        this.createdAt,
        this.updatedAt,
        this.room});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    schoolId = json['school_id'];
    roomId = json['room_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['school_id'] = this.schoolId;
    data['room_id'] = this.roomId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    return data;
  }
}

class Room {
  int? id;
  String? name;
  int? schoolId;
  int? classId;
  String? createdAt;
  String? updatedAt;
  List<Students>? students;
  List<Subjects>? subjects;

  Room(
      {this.id,
        this.name,
        this.schoolId,
        this.classId,
        this.createdAt,
        this.updatedAt,
        this.students,
        this.subjects});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    schoolId = json['school_id'];
    classId = json['class_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['school_id'] = this.schoolId;
    data['class_id'] = this.classId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? id;
  String? name;
  String? email;
   dynamic phone;
  String? photo;
  dynamic address;
  int? rank;
  int? schoolId;
  int? roomId;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  List<Degrees>? degrees;

  Students(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.photo,
        this.address,
        this.rank,
        this.schoolId,
        this.roomId,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.degrees});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    address = json['address'];
    rank = json['rank'];
    schoolId = json['school_id'];
    roomId = json['room_id'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['degrees'] != null) {
      degrees = <Degrees>[];
      json['degrees'].forEach((v) {
        degrees!.add(new Degrees.fromJson(v));
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
    data['room_id'] = this.roomId;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.degrees != null) {
      data['degrees'] = this.degrees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Degrees {
  int? id;
  String? subjectDegree;
  String? studentDegree;
  int? studentId;
  int? resultId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;

  Degrees(
      {this.id,
        this.subjectDegree,
        this.studentDegree,
        this.studentId,
        this.resultId,
        this.subjectId,
        this.createdAt,
        this.updatedAt});

  Degrees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectDegree = json['subject_degree'];
    studentDegree = json['student_degree'];
    studentId = json['student_id'];
    resultId = json['result_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject_degree'] = this.subjectDegree;
    data['student_degree'] = this.studentDegree;
    data['student_id'] = this.studentId;
    data['result_id'] = this.resultId;
    data['subject_id'] = this.subjectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Subjects {
  int? id;
  int? schoolId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  Subject? subject;

  Subjects(
      {this.id,
        this.schoolId,
        this.subjectId,
        this.createdAt,
        this.updatedAt,
        this.pivot,
        this.subject});

  Subjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    subject =
    json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['subject_id'] = this.subjectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? roomId;
  int? subjectId;

  Pivot({this.roomId, this.subjectId});

  Pivot.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    subjectId = json['subject_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['subject_id'] = this.subjectId;
    return data;
  }
}

class Subject {
  int? id;
  String? name;

  Subject({this.id, this.name});

  Subject.fromJson(Map<String, dynamic> json) {
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