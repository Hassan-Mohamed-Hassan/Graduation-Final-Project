class SchoolSubjectModel {
  String? status;
  List<ExistsSubjects>? existsSubjects;

  SchoolSubjectModel({this.status, this.existsSubjects});

  SchoolSubjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['exists_subjects'] != null) {
      existsSubjects = <ExistsSubjects>[];
      json['exists_subjects'].forEach((v) {
        existsSubjects!.add(new ExistsSubjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.existsSubjects != null) {
      data['exists_subjects'] =
          this.existsSubjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExistsSubjects {
  int? id;
  int? schoolId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;
  Subject? subject;

  ExistsSubjects(
      {this.id,
        this.schoolId,
        this.subjectId,
        this.createdAt,
        this.updatedAt,
        this.subject});

  ExistsSubjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
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