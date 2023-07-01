class GetChildrenModel {
  String? status;
  List<Children>? children;

  GetChildrenModel({this.status, this.children});

  GetChildrenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  int? id;
  String? name;
  String? email;
 // Null? phone;
  String? photo;
 // Null? address;
  int? rank;
  int? schoolId;
  int? roomId;
  int? parentId;
  String? createdAt;
  String? updatedAt;

  Children(
      {this.id,
        this.name,
        this.email,
    //    this.phone,
        this.photo,
       // this.address,
        this.rank,
        this.schoolId,
        this.roomId,
        this.parentId,
        this.createdAt,
        this.updatedAt});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
   // phone = json['phone'];
    photo = json['photo'];
   // address = json['address'];
    rank = json['rank'];
    schoolId = json['school_id'];
    roomId = json['room_id'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
  //  data['phone'] = this.phone;
    data['photo'] = this.photo;
   // data['address'] = this.address;
    data['rank'] = this.rank;
    data['school_id'] = this.schoolId;
    data['room_id'] = this.roomId;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}