class GetProfileModel {
  String? status;
  List<Profile>? profile;

  GetProfileModel({this.status, this.profile});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['profile'] != null) {
      profile = <Profile>[];
      json['profile'].forEach((v) {
        profile!.add(new Profile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.profile != null) {
      data['profile'] = this.profile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? name;
  String? email;
  dynamic phone;
  String? photo;
  dynamic address;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.photo,
        this.address,
        this.createdAt,
        this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}