class GetCourseModel {
  String? status;
  List<Courses>? courses;

  GetCourseModel({this.status, this.courses});

  GetCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  int? id;
  String? name;
  String? description;
  String? image;
  String? forWhich;
  int? teacherId;
  int? subjectId;
  CreatedAt? createdAt;
  String? updatedAt;
  int? videosCount;

  Courses(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.forWhich,
        this.teacherId,
        this.subjectId,
        this.createdAt,
        this.updatedAt,
        this.videosCount});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    forWhich = json['forWhich'];
    teacherId = json['teacher_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'] != null
        ? new CreatedAt.fromJson(json['created_at'])
        : null;
    updatedAt = json['updated_at'];
    videosCount = json['videos_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['forWhich'] = this.forWhich;
    data['teacher_id'] = this.teacherId;
    data['subject_id'] = this.subjectId;
    if (this.createdAt != null) {
      data['created_at'] = this.createdAt!.toJson();
    }
    data['updated_at'] = this.updatedAt;
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