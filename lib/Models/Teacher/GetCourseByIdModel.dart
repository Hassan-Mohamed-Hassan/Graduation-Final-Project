class GetCourseByIDModel {
  String? status;
  List<Course>? course;

  GetCourseByIDModel({this.status, this.course});

  GetCourseByIDModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['course'] != null) {
      course = <Course>[];
      json['course'].forEach((v) {
        course!.add(new Course.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.course != null) {
      data['course'] = this.course!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Course {
  int? id;
  String? name;
  String? description;
  String? image;
  String? forWhich;
  int? teacherId;
  int? subjectId;
  CreatedAt? createdAt;
  String? updatedAt;
  int? videosSumLength;
  //int? ratesSumRate;
  int? ratesCount;
  int? videosCount;
  Teacher? teacher;
  List<Videos>? videos;

  Course(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.forWhich,
        this.teacherId,
        this.subjectId,
        this.createdAt,
        this.updatedAt,
       // this.videosSumViews,
        this.videosSumLength,
       // this.ratesSumRate,
        this.ratesCount,
        this.videosCount,
        this.teacher,
        this.videos});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    forWhich = json['forWhich'];
    teacherId = json['teacher_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'] != null
        ? new CreatedAt.fromJson(json['created_at'])
        : null;
    updatedAt = json['updated_at'];
   // videosSumViews = json['videos_sum_views'];
    videosSumLength = json['videos_sum_length'];
   // ratesSumRate = json['rates_sum_rate'];
    ratesCount = json['rates_count'];
    videosCount = json['videos_count'];
    teacher =
    json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['forWhich'] = this.forWhich;
    data['teacher_id'] = this.teacherId;
    data['subject_id'] = this.subjectId;
    if (this.createdAt != null) {
      data['created_at'] = this.createdAt!.toJson();
    }
    data['updated_at'] = this.updatedAt;
   // data['videos_sum_views'] = this.videosSumViews;
    data['videos_sum_length'] = this.videosSumLength;
   // data['rates_sum_rate'] = this.ratesSumRate;
    data['rates_count'] = this.ratesCount;
    data['videos_count'] = this.videosCount;
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CreatedAt {
  String? createdAt;
  String? createdAtDate;

  CreatedAt({this.createdAt, this.createdAtDate});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    createdAtDate = json['createdAtDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['createdAtDate'] = this.createdAtDate;
    return data;
  }
}

class Teacher {
  int? id;
  String? name;
  String? email;
  //Null? phone;
  String? photo;
 // Null? address;
  int? rank;
  int? schoolId;
  int? subjectId;

  Teacher(
      {this.id,
        this.name,
        this.email,
       // this.phone,
        this.photo,
       // this.address,
        this.rank,
        this.schoolId,
        this.subjectId});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
   // phone = json['phone'];
    photo = json['photo'];
  //  address = json['address'];
    rank = json['rank'];
    schoolId = json['school_id'];
    subjectId = json['subject_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
   // data['phone'] = this.phone;
    data['photo'] = this.photo;
   // data['address'] = this.address;
    data['rank'] = this.rank;
    data['school_id'] = this.schoolId;
    data['subject_id'] = this.subjectId;
    return data;
  }
}

class Videos {
  int? id;
  String? name;
  String? description;
 // int? views;
  String? length;
  String? video;
  int? courseId;
  String? createdAt;
  String? updatedAt;
  int? ratesCount;

  Videos(
      {this.id,
        this.name,
        this.description,
      //  this.views,
        this.length,
        this.video,
        this.courseId,
        this.createdAt,
        this.updatedAt,
        this.ratesCount});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    //views = json['views'];
    length = json['length'];
    video = json['video'];
    courseId = json['course_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ratesCount = json['rates_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
   // data['views'] = this.views;
    data['length'] = this.length;
    data['video'] = this.video;
    data['course_id'] = this.courseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rates_count'] = this.ratesCount;
    return data;
  }
}