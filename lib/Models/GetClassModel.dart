class GetClassModel {
  String? status;
  List<Classes>? classes;

  GetClassModel({this.status, this.classes});

  GetClassModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classes {
  int? id;
  int? schoolId;
  int? classId;
  String? createdAt;
  String? updatedAt;
  int? roomsCount;
  ItsClass? itsClass;

  Classes(
      {this.id,
        this.schoolId,
        this.classId,
        this.createdAt,
        this.updatedAt,
        this.roomsCount,
        this.itsClass});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    classId = json['class_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roomsCount = json['rooms_count'];
    itsClass = json['its_class'] != null
        ? new ItsClass.fromJson(json['its_class'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['class_id'] = this.classId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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