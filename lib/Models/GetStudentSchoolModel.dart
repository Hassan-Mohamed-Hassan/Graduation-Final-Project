class GetStudentSchoolModel {
  String? status;
  List<Students>? students;

  GetStudentSchoolModel({this.status, this.students});

  GetStudentSchoolModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

}

class Students {
  int? id;
  String? name;
  int? schoolId;
  int? classId;
  String? createdAt;
  String? updatedAt;
  List<StudentsDetails>? details;

  Students(
      {this.id,
        this.name,
        this.schoolId,
        this.classId,
        this.createdAt,
        this.updatedAt,
        this.details});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    schoolId = json['school_id'];
    classId = json['class_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['students'] != null) {
      details = <StudentsDetails>[];
      json['students'].forEach((v) {
        details!.add(new StudentsDetails.fromJson(v));
      });
    }
  }

}

class StudentsDetails {
  int? id;
  String? name;
  String? email;
  //=Null? phone;
  String? photo;
 // Null? address;
  int? rank;
  int? schoolId;
  int? roomId;
 // Null? parentId;
  String? createdAt;
  String? updatedAt;

  StudentsDetails(
      {this.id,
        this.name,
        this.email,
    //    this.phone,
        this.photo,
      //  this.address,
        this.rank,
        this.schoolId,
        this.roomId,
     //   this.parentId,
        this.createdAt,
        this.updatedAt});

  StudentsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  //  phone = json['phone'];
    photo = json['photo'];
 //   address = json['address'];
    rank = json['rank'];
    schoolId = json['school_id'];
    roomId = json['room_id'];
 //   parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}