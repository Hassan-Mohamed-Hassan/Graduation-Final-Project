class StudentResult {
  String status;
  List<MyResult> results;

  StudentResult({required this.status, required this.results});

  factory StudentResult.fromJson(Map<String, dynamic> json) {
    return StudentResult(
      status: json['status'],
      results: (json['results'] as List)
          .map((resultJson) => MyResult.fromJson(resultJson))
          .toList(),
    );
  }
}

class MyResult {
  var id;
  String name;
  var schoolId;
  var roomId;
  DateTime createdAt;
  DateTime updatedAt;
  MyPivot pivot;
  MyRoom room;
  List<MyResultDetails> results;

  MyResult({
    required this.id,
    required this.name,
    required this.schoolId,
    required this.roomId,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
    required this.room,
    required this.results,
  });

  factory MyResult.fromJson(Map<String, dynamic> json) {
    return MyResult(
      id: json['id'],
      name: json['name'],
      schoolId: json['school_id'],
      roomId: json['room_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pivot: MyPivot.fromJson(json['pivot']),
      room: MyRoom.fromJson(json['room']),
      results: (json['results'] as List)
          .map((resultDetailsJson) => MyResultDetails.fromJson(resultDetailsJson))
          .toList(),
    );
  }
}

class MyPivot {
  var studentId;
  var resultId;

  MyPivot({required this.studentId, required this.resultId});

  factory MyPivot.fromJson(Map<String, dynamic> json) {
    return MyPivot(
      studentId: json['student_id'],
      resultId: json['result_id'],
    );
  }
}

class MyRoom {
  var id;
  String name;
  var schoolId;
  var classId;
  DateTime createdAt;
  DateTime updatedAt;
  List<MySubject> subjects;

  MyRoom({
    required this.id,
    required this.name,
    required this.schoolId,
    required this.classId,
    required this.createdAt,
    required this.updatedAt,
    required this.subjects,
  });

  factory MyRoom.fromJson(Map<String, dynamic> json) {
    return MyRoom(
      id: json['id'],
      name: json['name'],
      schoolId: json['school_id'],
      classId: json['class_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      subjects: (json['subjects'] as List)
          .map((subjectJson) => MySubject.fromJson(subjectJson))
          .toList(),
    );
  }
}

class MySubject {
  var id;
  var schoolId;
  var subjectId;
  DateTime createdAt;
  DateTime updatedAt;
  MyPivot pivot;
  MySubjectDetails subject;

  MySubject({
    required this.id,
    required this.schoolId,
    required this.subjectId,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
    required this.subject,
  });

  factory MySubject.fromJson(Map<String, dynamic> json) {
    return MySubject(
      id: json['id'],
      schoolId: json['school_id'],
      subjectId: json['subject_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pivot: MyPivot.fromJson(json['pivot']),
      subject: MySubjectDetails.fromJson(json['subject']),
    );
  }
}

class MySubjectDetails {
  var id;
  String name;

  MySubjectDetails({required this.id, required this.name});

  factory MySubjectDetails.fromJson(Map<String, dynamic> json) {
    return MySubjectDetails(
      id: json['id'],
      name: json['name'],
    );
  }
}

class MyResultDetails {
  var id;
  String subjectDegree;
  String studentDegree;
  var studentId;
  var resultId;
  var subjectId;
  DateTime createdAt;
  DateTime updatedAt;

  MyResultDetails({
    required this.id,
    required this.subjectDegree,
    required this.studentDegree,
    required this.studentId,
    required this.resultId,
    required this.subjectId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MyResultDetails.fromJson(Map<String, dynamic> json) {
    return MyResultDetails(
      id: json['id'],
      subjectDegree: json['subject_degree'],
      studentDegree: json['student_degree'],
      studentId: json['student_id'],
      resultId: json['result_id'],
      subjectId: json['subject_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}















































