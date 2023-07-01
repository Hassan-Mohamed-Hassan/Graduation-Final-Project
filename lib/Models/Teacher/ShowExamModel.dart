class GetShowModel {
  String? status;
  List<Exam>? exam;

  GetShowModel({this.status, this.exam});

  GetShowModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['exam'] != null) {
      exam = <Exam>[];
      json['exam'].forEach((v) { exam!.add(new Exam.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.exam != null) {
      data['exam'] = this.exam!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exam {
  int? id;
  String? name;
  String? degree;
  String? forr;
  int? teacherId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;
  List<Questions>? questions;

  Exam({this.id, this.name, this.degree, this.forr, this.teacherId, this.subjectId, this.createdAt, this.updatedAt, this.questions});

Exam.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
degree = json['degree'];
forr = json['for'];
teacherId = json['teacher_id'];
subjectId = json['subject_id'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];

if (json['questions'] != null) {
questions = <Questions>[];
json['questions'].forEach((v) { questions!.add(new Questions.fromJson(v)); });
}
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
  if (this.questions != null) {
  data['questions'] = this.questions!.map((v) => v.toJson()).toList();
  }
  return data;
}
}

class Questions {
  int? id;
  String? question;
  int? examId;
  List<Answers>? answers;

  Questions({this.id, this.question, this.examId, this.answers});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    examId = json['exam_id'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) { answers!.add(new Answers.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['exam_id'] = this.examId;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int? id;
  String? answer;
  String? isTrue;
  int? questionId;

  Answers({this.id, this.answer, this.isTrue, this.questionId});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
    isTrue = json['isTrue'];
    questionId = json['question_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer'] = this.answer;
    data['isTrue'] = this.isTrue;
    data['question_id'] = this.questionId;
    return data;
  }
}