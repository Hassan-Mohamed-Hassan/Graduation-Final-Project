class AllExams {
  AllExams({
    required this.status,
    required this.exams,
  });

  final String? status;
  final List<Exam> exams;

  factory AllExams.fromJson(Map<String, dynamic> json){
    return AllExams(
      status: json["status"],
      exams: json["exams"] == null ? [] : List<Exam>.from(json["exams"]!.map((x) => Exam.fromJson(x))),
    );
  }

}

class Exam {
  Exam({
    required this.id,
    required this.name,
    required this.degree,
    required this.examFor,
    required this.teacherId,
    required this.subjectId,
    required this.createdAt,
    required this.updatedAt,
    required this.questionsCount,
  });

  final int? id;
  final String? name;
  final String? degree;
  final String? examFor;
  final int? teacherId;
  final int? subjectId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? questionsCount;

  factory Exam.fromJson(Map<String, dynamic> json){
    return Exam(
      id: json["id"],
      name: json["name"],
      degree: json["degree"],
      examFor: json["for"],
      teacherId: json["teacher_id"],
      subjectId: json["subject_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      questionsCount: json["questions_count"],
    );
  }

}
