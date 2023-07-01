class AddClassModel {
  String? status;
  String? message;
  Class? clas;

  AddClassModel({this.status, this.message, this.clas});

  AddClassModel.fromJson(Map<String, dynamic> json) {
  status = json['status'];
  message = json['message'];
  clas = json['clas'] != null ? new Class.fromJson(json['clas']) : null;
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['status'] = this.status;
  data['message'] = this.message;
  if (this.clas != null) {
  data['clas'] = this.clas!.toJson();
  }
  return data;
  }
}

class Class {
  int? schoolId;
  String? classId;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? roomsCount;
  ItsClass? itsClass;

  Class({this.schoolId, this.classId, this.updatedAt, this.createdAt, this.id, this.roomsCount, this.itsClass});

  Class.fromJson(Map<String, dynamic> json) {
    schoolId = json['school_id'];
    classId = json['class_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    roomsCount = json['rooms_count'];
    itsClass = json['its_class'] != null ? new ItsClass.fromJson(json['its_class']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['school_id'] = this.schoolId;
    data['class_id'] = this.classId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['rooms_count'] = this.roomsCount;
    if (this.itsClass != null) {
      data['its_class'] = this.itsClass!.toJson();
    }
    return data;
  }
}

class ItsClass {
  int? id;
  String? name;

  ItsClass({this.id, this.name});

  ItsClass.fromJson(Map<String, dynamic> json) {
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