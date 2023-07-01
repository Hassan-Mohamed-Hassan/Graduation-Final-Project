class AddSubjectModel {
  String? status;
  String? message;
  Subject? subject;

  AddSubjectModel({this.status, this.message, this.subject});

  AddSubjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    subject =
    json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    return data;
  }
}

class Subject {
  int? schoolId;
  String? subjectId;
  String? updatedAt;
  String? createdAt;
  int? id;
  Subject? subject;

  Subject(
      {this.schoolId,
        this.subjectId,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.subject});

  Subject.fromJson(Map<String, dynamic> json) {
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    subject =
    json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['school_id'] = this.schoolId;
    data['subject_id'] = this.subjectId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    return data;
  }
}

class SubjectData {
  int? id;
  String? name;

  SubjectData({this.id, this.name});

  SubjectData.fromJson(Map<String, dynamic> json) {
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