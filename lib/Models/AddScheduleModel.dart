class AddScheduleModel {
  String? status;
  String? message;
  Period? period;

  AddScheduleModel({this.status, this.message, this.period});

  AddScheduleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    period =
    json['period'] != null ? new Period.fromJson(json['period']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.period != null) {
      data['period'] = this.period!.toJson();
    }
    return data;
  }
}

class Period {
  String? period;
  String? roomId;
  int? id;

  Period({this.period, this.roomId, this.id});

  Period.fromJson(Map<String, dynamic> json) {
    period = json['period'];
    roomId = json['room_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['period'] = this.period;
    data['room_id'] = this.roomId;
    data['id'] = this.id;
    return data;
  }
}