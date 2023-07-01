class ParentResult {
  int id;
  String name;
  String email;
  dynamic phone;
  String photo;
  dynamic address;
  int rank;
  var schoolId;
  var roomId;
  int parentId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Result> results;

  ParentResult({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.address,
    required this.rank,
    required this.schoolId,
    required this.roomId,
    required this.parentId,
    required this.createdAt,
    required this.updatedAt,
    required this.results,
  });

  factory ParentResult.fromJson(Map<String, dynamic> json) {
    var resultsList = json['result'] as List;
    List<Result> results =
    resultsList.map((resultJson) => Result.fromJson(resultJson)).toList();

    return ParentResult(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photo: json['photo'],
      address: json['address'],
      rank: json['rank'],
      schoolId: json['school_id'],
      roomId: json['room_id'],
      parentId: json['parent_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      results: results,
    );
  }
}

class Result {
  int id;
  String name;
  int schoolId;
  int roomId;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;
  Room room;
  List<ResultData> results;

  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) {
    var resultsDataList = json['results'] as List;
    List<ResultData> resultsData = resultsDataList
        .map((resultDataJson) => ResultData.fromJson(resultDataJson))
        .toList();

    return Result(
      id: json['id'],
      name: json['name'],
      schoolId: json['school_id'],
      roomId: json['room_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pivot: Pivot.fromJson(json['pivot']),
      room: Room.fromJson(json['room']),
      results: resultsData,
    );
  }
}

class Pivot {
  dynamic studentId;
  dynamic resultId;

  Pivot({
    required this.studentId,
    required this.resultId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      studentId: json['student_id'],
      resultId: json['result_id'],
    );
  }
}

class Room {
  int id;
  String name;
  int schoolId;
  int classId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Subject> subjects;

  Room({
    required this.id,
    required this.name,
    required this.schoolId,
    required this.classId,
    required this.createdAt,
    required this.updatedAt,
    required this.subjects,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    var subjectsList = json['subjects'] as List;
    List<Subject> subjects =
    subjectsList.map((subjectJson) => Subject.fromJson(subjectJson)).toList();

    return Room(
      id: json['id'],
      name: json['name'],
      schoolId: json['school_id'],
      classId: json['class_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      subjects: subjects,
    );
  }
}

class Subject {
  int id;
  int schoolId;
  int subjectId;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;
  SubjectData subject;

  Subject({
    required this.id,
    required this.schoolId,
    required this.subjectId,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
    required this.subject,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      schoolId: json['school_id'],
      subjectId: json['subject_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pivot: Pivot.fromJson(json['pivot']),
      subject: SubjectData.fromJson(json['subject']),
    );
  }
}

class SubjectData {
  int id;
  String name;

  SubjectData({
    required this.id,
    required this.name,
  });

  factory SubjectData.fromJson(Map<String, dynamic> json) {
    return SubjectData(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ResultData {
  int id;
  int resultId;
  String subjectdegree;
  String studentdegree;
  int subjectId;
  DateTime createdAt;
  DateTime updatedAt;

  ResultData({
    required this.id,
    required this.resultId,
    required this.subjectdegree,
    required this.studentdegree,
    required this.subjectId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) {
    return ResultData(
      id: json['id'],
      resultId: json['result_id'],
      studentdegree: json['student_degree'],
      subjectdegree: json['subject_degree'],
      subjectId: json['subject_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}