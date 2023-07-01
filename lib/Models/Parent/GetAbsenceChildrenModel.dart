class GetAbsenceChildrenModel {
  String? status;
  List<Room>? room;

  GetAbsenceChildrenModel({this.status, this.room});

  GetAbsenceChildrenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['room'] != null) {
      room = <Room>[];
      json['room'].forEach((v) {
        room!.add(new Room.fromJson(v));
      });
    }
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
  List<Absence>? absence;

  Room(
      {this.id,
        this.name,
        this.schoolId,
        this.classId,
        this.createdAt,
        this.updatedAt,
        this.students,
        this.absence});

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
    if (json['absence'] != null) {
      absence = <Absence>[];
      json['absence'].forEach((v) {
        absence!.add(new Absence.fromJson(v));
      });
    }else{
      null;
    }
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
    }else null;
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

}