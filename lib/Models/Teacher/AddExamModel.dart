class AddExamModel {
  String? status;
  String? message;
  Exam? exam;

  AddExamModel({this.status, this.message, this.exam});

  AddExamModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    exam = json['exam'] != null ? new Exam.fromJson(json['exam']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.exam != null) {
      data['exam'] = this.exam!.toJson();
    }
    return data;
  }
}

class Exam {
  String? name;
  String? degree;
  String? forr;
  int? teacherId;
  int? subjectId;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? questionsCount;

  Exam({this.name, this.degree, this.forr, this.teacherId, this.subjectId, this.updatedAt, this.createdAt, this.id, this.questionsCount});

Exam.fromJson(Map<String, dynamic> json) {
name = json['name'];
degree = json['degree'];
forr = json['for'];
teacherId = json['teacher_id'];
subjectId = json['subject_id'];
updatedAt = json['updated_at'];
createdAt = json['created_at'];
id = json['id'];
questionsCount = json['questions_count'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['name'] = this.name;
  data['degree'] = this.degree;
  data['for'] = this.forr;
  data['teacher_id'] = this.teacherId;
  data['subject_id'] = this.subjectId;
  data['updated_at'] = this.updatedAt;
  data['created_at'] = this.createdAt;
  data['id'] = this.id;
  data['questions_count'] = this.questionsCount;
  return data;
}
}