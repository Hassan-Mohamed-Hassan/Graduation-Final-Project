class AddAnswerModel {
  String? status;
  String? message;
  Answer? answer;

  AddAnswerModel({this.status, this.message, this.answer});

  AddAnswerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    answer =
    json['answer'] != null ? new Answer.fromJson(json['answer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.answer != null) {
      data['answer'] = this.answer!.toJson();
    }
    return data;
  }
}

class Answer {
  String? answer;
  String? questionId;
  int? id;

  Answer({this.answer, this.questionId, this.id});

  Answer.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    questionId = json['question_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['question_id'] = this.questionId;
    data['id'] = this.id;
    return data;
  }
}