class GetRoomModel {
  String? status;
  List<Rooms>? rooms;
  String? message;

  GetRoomModel({this.status, this.rooms,this.message});

  GetRoomModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message=json['message'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

}

class Rooms {
  int? id;
  String? name;
  int? schoolId;
  int? classId;
  String? createdAt;
  String? updatedAt;
  MainClass? mainClass;

  Rooms(
      {this.id,
        this.name,
        this.schoolId,
        this.classId,
        this.createdAt,
        this.updatedAt,
        this.mainClass});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    schoolId = json['school_id'];
    classId = json['class_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mainClass = json['main_class'] != null
        ? new MainClass.fromJson(json['main_class'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['school_id'] = this.schoolId;
    data['class_id'] = this.classId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.mainClass != null) {
      data['main_class'] = this.mainClass!.toJson();
    }
    return data;
  }
}

class MainClass {
  int? id;
  int? schoolId;
  int? classId;
  String? createdAt;
  String? updatedAt;
  ItsClass? itsClass;

  MainClass(
      {this.id,
        this.schoolId,
        this.classId,
        this.createdAt,
        this.updatedAt,
        this.itsClass});

  MainClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    classId = json['class_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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