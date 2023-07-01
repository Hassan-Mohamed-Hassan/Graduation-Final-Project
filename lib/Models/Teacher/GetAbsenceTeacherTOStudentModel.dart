class GetAbsenceTeacherTOStudentModel {
  String? status;
  List<Rooms>? rooms;

  GetAbsenceTeacherTOStudentModel({this.status, this.rooms});

  GetAbsenceTeacherTOStudentModel.fromJson(Map<String, dynamic> json) {
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
  int? classId;
  String? createdAt;
  String? updatedAt;
  List<Students>? students;
  List<Absence>? absence;

  Rooms(
      {this.id,
        this.name,
        this.schoolId,
        this.classId,
        this.createdAt,
        this.updatedAt,
        this.students,
        this.absence});

  Rooms.fromJson(Map<String, dynamic> json) {
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
    if (json['absence'] != null) {
      absence = <Absence>[];
      json['absence'].forEach((v) {
        absence!.add(new Absence.fromJson(v));
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
    if (this.absence != null) {
      data['absence'] = this.absence!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? address;
  int? rank;
  int? schoolId;
  int? roomId;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  List<Absences>? absences;

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
        this.absences});

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
    data['room_id'] = this.roomId;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.absences != null) {
      data['absences'] = this.absences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Absences {
  int? id;
  int? studentId;
  int? takeId;
  int? roomId;
  String? status;
  String? createdAt;
  String? updatedAt;

  Absences(
      {this.id,
        this.studentId,
        this.takeId,
        this.roomId,
        this.status,
        this.createdAt,
        this.updatedAt});

  Absences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    takeId = json['take_id'];
    roomId = json['room_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['take_id'] = this.takeId;
    data['room_id'] = this.roomId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Absence {
  int? id;
  int? roomId;
  int? teacherId;
  String? createdAt;
  String? updatedAt;

  Absence(
      {this.id, this.roomId, this.teacherId, this.createdAt, this.updatedAt});

  Absence.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomId = json['room_id'];
    teacherId = json['teacher_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_id'] = this.roomId;
    data['teacher_id'] = this.teacherId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}