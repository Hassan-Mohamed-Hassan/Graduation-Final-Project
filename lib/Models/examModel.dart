class ExamModel {
  ExamModel({
    required this.status,
    required this.exam,
  });

  final String? status;
  final List<Exam> exam;

  factory ExamModel.fromJson(Map<String, dynamic> json){
    return ExamModel(
      status: json["status"],
      exam: json["exam"] == null ? [] : List<Exam>.from(json["exam"]!.map((x) => Exam.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "exam": exam.map((x) => x?.toJson()).toList(),
  };

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
    required this.studentExamCount,
    required this.questions,
    required this.teacher,
  });

  final int? id;
  final String? name;
  final String? degree;
  final String? examFor;
  final int? teacherId;
  final int? subjectId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? studentExamCount;
  final List<Question> questions;
  final Teacher? teacher;

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
      studentExamCount: json["student_exam_count"],
      questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
      teacher: json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "degree": degree,
    "for": examFor,
    "teacher_id": teacherId,
    "subject_id": subjectId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "student_exam_count": studentExamCount,
    "questions": questions.map((x) => x?.toJson()).toList(),
    "teacher": teacher?.toJson(),
  };

}

class Question {
  Question({
    required this.id,
    required this.question,
    required this.examId,
    required this.answers,
  });

  final int? id;
  final String? question;
  final int? examId;
  final List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json){
    return Question(
      id: json["id"],
      question: json["question"],
      examId: json["exam_id"],
      answers: json["answers"] == null ? [] : List<Answer>.from(json["answers"]!.map((x) => Answer.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "exam_id": examId,
    "answers": answers.map((x) => x?.toJson()).toList(),
  };

}

class Answer {
  Answer({
    required this.id,
    required this.answer,
    required this.isTrue,
    required this.questionId,
  });

  final int? id;
  final String? answer;
  final String? isTrue;
  final int? questionId;

  factory Answer.fromJson(Map<String, dynamic> json){
    return Answer(
      id: json["id"],
      answer: json["answer"],
      isTrue: json["isTrue"],
      questionId: json["question_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "answer": answer,
    "isTrue": isTrue,
    "question_id": questionId,
  };

}

class Teacher {
  Teacher({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory Teacher.fromJson(Map<String, dynamic> json){
    return Teacher(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

}
