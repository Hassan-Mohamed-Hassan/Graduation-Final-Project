class GetscheduleModel {
  String? status;
  List<Rooms>? rooms;

  GetscheduleModel({this.status, this.rooms});

  GetscheduleModel.fromJson(Map<String, dynamic> json) {
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
  List<Periods>? periods;

  Rooms(
      {this.id,
        this.name,
        this.schoolId,
        this.classId,
        this.createdAt,
        this.updatedAt,
        this.periods});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    schoolId = json['school_id'];
    classId = json['class_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['periods'] != null) {
      periods = <Periods>[];
      json['periods'].forEach((v) {
        periods!.add(new Periods.fromJson(v));
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
    if (this.periods != null) {
      data['periods'] = this.periods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Periods {
  int? id;
  String? period;
  int? roomId;
  List<Lessons>? lessons;

  Periods({this.id, this.period, this.roomId, this.lessons});

  Periods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    period = json['period'];
    roomId = json['room_id'];
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['period'] = this.period;
    data['room_id'] = this.roomId;
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lessons {
  int? id;
  int? teacherId;
  int? periodId;
  int? subjectId;
  int? dayId;
  int? roomId;
  String? createdAt;
  String? updatedAt;
  Teacher? teacher;
  Subject? subject;

  Lessons(
      {this.id,
        this.teacherId,
        this.periodId,
        this.subjectId,
        this.dayId,
        this.roomId,
        this.createdAt,
        this.updatedAt,
        this.teacher,
        this.subject});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    periodId = json['period_id'];
    subjectId = json['subject_id'];
    dayId = json['day_id'];
    roomId = json['room_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teacher =
    json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    subject =
    json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacher_id'] = this.teacherId;
    data['period_id'] = this.periodId;
    data['subject_id'] = this.subjectId;
    data['day_id'] = this.dayId;
    data['room_id'] = this.roomId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    return data;
  }
}

class Teacher {
  int? id;
  String? name;
  String? email;
 // Null? phone;
  String? photo;
 // Null? address;
  int? rank;
  int? schoolId;
  int? subjectId;

  Teacher(
      {this.id,
        this.name,
        this.email,
     //   this.phone,
        this.photo,
       // this.address,
        this.rank,
        this.schoolId,
        this.subjectId});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
   // phone = json['phone'];
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
  //  data['phone'] = this.phone;
    data['photo'] = this.photo;
   // data['address'] = this.address;
    data['rank'] = this.rank;
    data['school_id'] = this.schoolId;
    data['subject_id'] = this.subjectId;
    return data;
  }
}

class Subject {
  int? id;
  int? schoolId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;

  Subject(
      {this.id, this.schoolId, this.subjectId, this.createdAt, this.updatedAt});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['subject_id'] = this.subjectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}