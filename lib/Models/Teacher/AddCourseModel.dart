import 'dart:io';

class AddCourseModel {
  String? status;
  String? message;
  Course? course;

  AddCourseModel({this.status, this.message, this.course});

  AddCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    course =
    json['course'] != null ? new Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    return data;
  }
}

class Course {
  String? description;
  int? teacherId;
  int? subjectId;
  String? forWhich;
  File? image;
  String? name;
  String? updatedAt;
  CreatedAt? createdAt;
  int? id;
  int? videosCount;

  Course(
      {this.description,
        this.teacherId,
        this.subjectId,
        this.forWhich,
        this.image,
        this.name,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.videosCount});

  Course.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    teacherId = json['teacher_id'];
    subjectId = json['subject_id'];
    forWhich = json['forWhich'];
    image = json['image'];
    name = json['name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'] != null
        ? new CreatedAt.fromJson(json['created_at'])
        : null;
    id = json['id'];
    videosCount = json['videos_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['teacher_id'] = this.teacherId;
    data['subject_id'] = this.subjectId;
    data['forWhich'] = this.forWhich;
    data['image'] = this.image;
    data['name'] = this.name;
    data['updated_at'] = this.updatedAt;
    if (this.createdAt != null) {
      data['created_at'] = this.createdAt!.toJson();
    }
    data['id'] = this.id;
    data['videos_count'] = this.videosCount;
    return data;
  }
}

class CreatedAt {
  String? createdAt;
  String? createdAtDate;

  CreatedAt({this.createdAt, this.createdAtDate});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    createdAtDate = json['createdAtDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['createdAtDate'] = this.createdAtDate;
    return data;
  }
}