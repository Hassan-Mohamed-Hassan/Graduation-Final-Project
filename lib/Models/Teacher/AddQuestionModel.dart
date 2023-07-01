class AddQuestionModel {
  String? status;
  String? message;
  Question? question;

  AddQuestionModel({this.status, this.message, this.question});

  AddQuestionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
  }

}

class Question {
  String? examId;
  String? question;
  int? id;
  List<Null>? answers;

  Question({this.examId, this.question, this.id, this.answers});

  Question.fromJson(Map<String, dynamic> json) {
    examId = json['exam_id'];
    question = json['question'];
    id = json['id'];
    if (json['answers'] == null) {
      answers = null;

    }
  }

}