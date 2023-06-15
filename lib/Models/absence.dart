class Absence {
  Absence({
    required this.status,
    required this.room,
  });

  final String? status;
  final List<Room> room;

  factory Absence.fromJson(Map<String, dynamic> json){
    return Absence(
      status: json["status"],
      room: json["room"] == null ? [] : List<Room>.from(json["room"]!.map((x) => Room.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "room": room.map((x) => x?.toJson()).toList(),
  };

}

class Room {
  Room({
    required this.id,
    required this.name,
    required this.schoolId,
    required this.classId,
    required this.createdAt,
    required this.updatedAt,
    required this.students,
    required this.absence,
  });

  final int? id;
  final String? name;
  final int? schoolId;
  final int? classId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Student> students;
  final List<AbsenceElement> absence;

  factory Room.fromJson(Map<String, dynamic> json){
    return Room(
      id: json["id"],
      name: json["name"],
      schoolId: json["school_id"],
      classId: json["class_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      students: json["students"] == null ? [] : List<Student>.from(json["students"]!.map((x) => Student.fromJson(x))),
      absence: json["absence"] == null ? [] : List<AbsenceElement>.from(json["absence"]!.map((x) => AbsenceElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "school_id": schoolId,
    "class_id": classId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "students": students.map((x) => x?.toJson()).toList(),
    "absence": absence.map((x) => x?.toJson()).toList(),
  };

}

class AbsenceElement {
  AbsenceElement({
    required this.id,
    required this.roomId,
    required this.teacherId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? roomId;
  final int? teacherId;
  final String? createdAt;
  final DateTime? updatedAt;

  factory AbsenceElement.fromJson(Map<String, dynamic> json){
    return AbsenceElement(
      id: json["id"],
      roomId: json["room_id"],
      teacherId: json["teacher_id"],
      createdAt: json["created_at"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "room_id": roomId,
    "teacher_id": teacherId,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
  };

}

class Student {
  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.address,
    required this.rank,
    required this.schoolId,
    required this.roomId,
    required this.parentId,
    required this.createdAt,
    required this.updatedAt,
    required this.absences,
  });

  final int? id;
  final String? name;
  final String? email;
  final dynamic phone;
  final String? photo;
  final dynamic address;
  final int? rank;
  final int? schoolId;
  final int? roomId;
  final dynamic parentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic> absences;

  factory Student.fromJson(Map<String, dynamic> json){
    return Student(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      photo: json["photo"],
      address: json["address"],
      rank: json["rank"],
      schoolId: json["school_id"],
      roomId: json["room_id"],
      parentId: json["parent_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      absences: json["absences"] == null ? [] : List<dynamic>.from(json["absences"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "photo": photo,
    "address": address,
    "rank": rank,
    "school_id": schoolId,
    "room_id": roomId,
    "parent_id": parentId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "absences": absences.map((x) => x).toList(),
  };

}
