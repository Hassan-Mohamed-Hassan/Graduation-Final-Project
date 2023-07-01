/*
class GetExamsChildrenModel {
  String? status;
  List<Exams>? exams;

  GetExamsChildrenModel({this.status, this.exams});

  GetExamsChildrenModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  dynamic phone;
  String? photo;
  dynamic address;
  int? rank;
  int? schoolId;
  int? roomId;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  int? examsSumExamDegree;
  dynamic examsSumStudentDegree;
  List<ExamsDetails>? examsDetails;

  Exams({this.id, this.name, this.email, this.phone, this.photo, this.address, this.rank, this.schoolId, this.roomId, this.parentId, this.createdAt, this.updatedAt, this.examsSumExamDegree, this.examsSumStudentDegree, this.examsDetails});

  Exams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    address = json['address'];
    rank = json['rank'];
    schoolId = json['school_id'];
    roomId = json['room_id'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    examsSumExamDegree = json['exams_sum_exam_degree'];
    examsSumStudentDegree = json['exams_sum_student_degree'];
    if (json['examsDetails'] != null) {
      examsDetails = <ExamsDetails>[];
      json['examsDetails'].forEach((v) { examsDetails!.add(new ExamsDetails.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['address'] = this.address;
    data['rank'] = this.rank;
    data['school_id'] = this.schoolId;
    data['room_id'] = this.roomId;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['exams_sum_exam_degree'] = this.examsSumExamDegree;
    data['exams_sum_student_degree'] = this.examsSumStudentDegree;
    if (this.examsDetails != null) {
      data['examsDetails'] = this.examsDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class ExamsDetails {
  int? id;
  int? examDegree;
  dynamic studentDegree;
  String? status;
  String? forr;
  int? examId;
  int? studentId;
  String? createdAt;
  String? updatedAt;
  Exam? exam;

  ExamsDetails({this.id, this.examDegree, this.studentDegree, this.status, this.forr, this.examId, this.studentId, this.createdAt, this.updatedAt, this.exam});

  ExamsDetails.fromJson(Map<String, dynamic> json) {
id = json['id'];
examDegree = json['exam_degree'];
studentDegree = json['student_degree'];
status = json['status'];
forr = json['for'];
examId = json['exam_id'];
studentId = json['student_id'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
exam = json['exam'] != null ? new Exam.fromJson(json['exam']) : null;
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['exam_degree'] = this.examDegree;
  data['student_degree'] = this.studentDegree;
  data['status'] = this.status;
  data['for'] = this.forr;
  data['exam_id'] = this.examId;
  data['student_id'] = this.studentId;
  data['created_at'] = this.createdAt;
  data['updated_at'] = this.updatedAt;
  if (this.exam != null) {
  data['exam'] = this.exam!.toJson();
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
  Subject? subject;

  Exam({this.id, this.name, this.degree, this.forr, this.teacherId, this.subjectId, this.createdAt, this.updatedAt, this.subject});

Exam.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
degree = json['degree'];
forr = json['for'];
teacherId = json['teacher_id'];
subjectId = json['subject_id'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
subject = json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
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
  if (this.subject != null) {
  data['subject'] = this.subject!.toJson();
  }
  return data;
}
}
class Subject {
  int? id;
  int? schoolId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;
  SubjectDetails? subjectDetails;

  Subject({this.id, this.schoolId, this.subjectId, this.createdAt, this.updatedAt, this.subjectDetails});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subjectDetails = json['subjectDetails'] != null ? new SubjectDetails.fromJson(json['subjectDetails']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['subject_id'] = this.subjectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subjectDetails != null) {
      data['subjectDetails'] = this.subjectDetails!.toJson();
    }
    return data;
  }
}
class SubjectDetails {
  int? id;
  String? name;

  SubjectDetails({this.id, this.name});

  SubjectDetails.fromJson(Map<String, dynamic> json) {
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

 */
/*
class GetExamsChildrenModel {
  String? status;
  List<Exams>? exams;

  GetExamsChildrenModel({this.status, this.exams});

  GetExamsChildrenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['exams'] != null) {
      exams=<Exams>[];
      json['exams'].forEach((v) { exams!.add( Exams.fromJson(v)); });
    }
  }

}

class Exams {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? address;
  int? rank;
  int? schoolId;
  int? roomId;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  int ?examsSumExamDegree;
  dynamic examsSumStudentDegree;
  List<ExamsDetails>? examsDetails;

  Exams({this.id, this.name, this.email, this.phone, this.photo, this.address, this.rank, this.schoolId, this.roomId, this.parentId, this.createdAt, this.updatedAt, this.examsSumExamDegree, this.examsSumStudentDegree, this.examsDetails});

  Exams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    address = json['address'];
    rank = json['rank'];
    schoolId = json['school_id'];
    roomId = json['room_id'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    examsSumExamDegree = json['exams_sum_exam_degree'];
    examsSumStudentDegree = json['exams_sum_student_degree'];
    if (json['examsDetails'] != null) {
      examsDetails = <ExamsDetails>[];
      json['examsDetails'].forEach((v) { examsDetails!.add(new ExamsDetails.fromJson(v)); });
    }
  }

}

class ExamsDetails {
  int? id;
  int? examDegree;
  dynamic studentDegree;
  String ?status;
  String? forr;
  int? examId;
  int? studentId;
  String? createdAt;
  String? updatedAt;
  Exam? exam;

  ExamsDetails({this.id, this.examDegree, this.studentDegree, this.status, this.forr, this.examId, this.studentId, this.createdAt, this.updatedAt, this.exam});

  ExamsDetails.fromJson(Map<String, dynamic> json) {
id = json['id'];
examDegree = json['exam_degree'];
studentDegree = json['student_degree'];
status = json['status'];
forr = json['for'];
examId = json['exam_id'];
studentId = json['student_id'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
exam = json['exam'] != null ? new Exam.fromJson(json['exam']) : null;
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
  Subject? subject;

  Exam({this.id, this.name, this.degree, this.forr, this.teacherId, this.subjectId, this.createdAt, this.updatedAt, this.subject});

Exam.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
degree = json['degree'];
forr = json['for'];
teacherId = json['teacher_id'];
subjectId = json['subject_id'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
subject = json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
}

}

class Subject {
  int? id;
  int? schoolId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;
  SubjectDetails? subjectDetails;

  Subject({this.id, this.schoolId, this.subjectId, this.createdAt, this.updatedAt, this.subjectDetails});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subjectDetails = json['subjectDetails'] != null ? new SubjectDetails.fromJson(json['subjectDetails']) : null;
  }

}

class SubjectDetails {
  int? id;
  String? name;

  SubjectDetails({this.id, this.name});

  SubjectDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

}

 */



class GetExamsChildrenModel {
  String? status;
  List<Exams>? exams;

  GetExamsChildrenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['exams'] != null) {
      exams = <Exams>[];
      json['exams'].forEach((v) { exams!.add(Exams.fromJson(v)); });
    }
  }
}

class Exams {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? address;
  int? rank;
  int? schoolId;
  int? roomId;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  int? examsSumExamDegree;
  dynamic examsSumStudentDegree;
  List<Examss>? examss;

  Exams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    address = json['address'];
    rank = json['rank'];
    schoolId = json['school_id'];
    roomId = json['room_id'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    examsSumExamDegree = json['exams_sum_exam_degree'];
    examsSumStudentDegree = json['exams_sum_student_degree'];
    if (json['exams'] != null) {
      examss = <Examss>[];
      json['exams'].forEach((v) { examss!.add(Examss.fromJson(v)); });
    }
  }
}

class Examss {
  int? id;
  int? examDegree;
  dynamic studentDegree;
  String? status;
  String? fort;
  int? examId;
  int? studentId;
  String? createdAt;
  String? updatedAt;
  Exam? exam;

  Examss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examDegree = json['exam_degree'];
    studentDegree = json['student_degree'];
    status = json['status'];
    fort = json['for'];
    examId = json['exam_id'];
    studentId = json['student_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    exam = json['exam'] != null ?  Exam.fromJson(json['exam']) : null;
  }
}

class Exam {
  int? id;
  String? name;
  String? degree;
  String? me;
  int? teacherId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;
  SubjectInfo? subject;

  Exam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    degree = json['degree'];
    me = json['for'];
    teacherId = json['teacher_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subject = json['subject'] != null ?  SubjectInfo.fromJson(json['subject']) : null;
  }
}

class SubjectInfo {
  int? id;
  int? schoolId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;
  Subjects? subject;

  SubjectInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subject = json['subject'] != null ?  Subjects.fromJson(json['subject']) : null;
  }
}

class Subjects {
  int? id;
  String? name;

  Subjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}













