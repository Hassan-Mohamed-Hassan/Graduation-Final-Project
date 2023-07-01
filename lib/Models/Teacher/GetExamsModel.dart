class GetExamsModel {
  String? status;
  List<Exams>? exams;

  GetExamsModel({this.status, this.exams});

  GetExamsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['exams'] != null) {
      exams = <Exams>[];
      json['exams'].forEach((v) { exams!.add(new Exams.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.exams != null) {
      data['exams'] = this.exams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exams {
  int? id;
  String? name;
  String? degree;
  String? forr;
  int? teacherId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;
  int? questionsCount;

  Exams({this.id, this.name, this.degree, this.forr, this.teacherId, this.subjectId, this.createdAt, this.updatedAt, this.questionsCount});

Exams.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
degree = json['degree'];
forr = json['for'];
teacherId = json['teacher_id'];
subjectId = json['subject_id'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
questionsCount = json['questions_count'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['name'] = this.name;
  data['degree'] = this.degree;
  data['for'] = this.forr;
  data['teacher_id'] = this.teacherId;
  data['subject_id'] = this.subjectId;
  data['created_at'] = this.createdAt;
  data['updated_at'] = this.updatedAt;
  data['questions_count'] = this.questionsCount;
  return data;
}
}