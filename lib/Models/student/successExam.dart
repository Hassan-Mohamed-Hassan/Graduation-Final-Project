class Exam {
  Exam({
    required this.id,
    required this.examDegree,
    required this.studentDegree,
    required this.status,
    required this.forField,
    required this.examId,
    required this.studentId,
    required this.createdAt,
    required this.updatedAt,
    required this.exam,
  });

  int id;
  var examDegree;
  var studentDegree;
  String status;
  String forField;
  int examId;
  int studentId;
  DateTime createdAt;
  DateTime updatedAt;
  ExamData exam;

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
    id: json["id"],
    examDegree: json["exam_degree"],
    studentDegree: json["student_degree"],
    status: json["status"],
    forField: json["for"],
    examId: json["exam_id"],
    studentId: json["student_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    exam: ExamData.fromJson(json["exam"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "exam_degree": examDegree,
    "student_degree": studentDegree,
    "status": status,
    "for": forField,
    "exam_id": examId,
    "student_id": studentId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "exam": exam.toJson(),
  };
}

class ExamData {
  ExamData({
    required this.id,
    required this.name,
    required this.degree,
    required this.forField,
    required this.teacherId,
    required this.subjectId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String degree;
  String forField;
  int teacherId;
  int subjectId;
  DateTime createdAt;
  DateTime updatedAt;

  factory ExamData.fromJson(Map<String, dynamic> json) => ExamData(
    id: json["id"],
    name: json["name"],
    degree: json["degree"],
    forField: json["for"],
    teacherId: json["teacher_id"],
    subjectId: json["subject_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "degree": degree,
    "for": forField,
    "teacher_id": teacherId,
    "subject_id": subjectId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class SuccessExam {
  SuccessExam({
    required this.status,
    required this.exams,
  });

  String status;
  List<Exam> exams;

  factory SuccessExam.fromJson(Map<String, dynamic> json) => SuccessExam(
    status: json["status"],
    exams: List<Exam>.from(json["exams"].map((x) => Exam.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "exams": List<dynamic>.from(exams.map((x) => x.toJson())),
  };
}