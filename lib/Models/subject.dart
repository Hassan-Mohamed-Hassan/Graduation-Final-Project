class Subject {
  Subject({
    required this.status,
    required this.subjects,
  });

  final String? status;
  final List<SubjectElement> subjects;

  factory Subject.fromJson(Map<String, dynamic> json){
    return Subject(
      status: json["status"],
      subjects: json["subjects"] == null ? [] : List<SubjectElement>.from(json["subjects"]!.map((x) => SubjectElement.fromJson(x))),
    );
  }

}

class SubjectElement {
  SubjectElement({
    required this.id,
    required this.subjectId,
    required this.subject,
  });

  final int? id;
  final int? subjectId;
  final SubjectSubject? subject;

  factory SubjectElement.fromJson(Map<String, dynamic> json){
    return SubjectElement(
      id: json["id"],
      subjectId: json["subject_id"],
      subject: json["subject"] == null ? null : SubjectSubject.fromJson(json["subject"]),
    );
  }

}

class SubjectSubject {
  SubjectSubject({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory SubjectSubject.fromJson(Map<String, dynamic> json){
    return SubjectSubject(
      id: json["id"],
      name: json["name"],
    );
  }

}
