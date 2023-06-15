class Vidoes {
  Vidoes({
    required this.status,
    required this.course,
  });

  final String? status;
  final List<Course> course;

  factory Vidoes.fromJson(Map<String, dynamic> json){
    return Vidoes(
      status: json["status"],
      course: json["course"] == null ? [] : List<Course>.from(json["course"]!.map((x) => Course.fromJson(x))),
    );
  }

}

class Course {
  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.forWhich,
    required this.teacherId,
    required this.subjectId,
    required this.createdAt,
    required this.updatedAt,
    required this.videosSumLength,
    required this.videosSumViews,
    required this.ratesSumRate,
    required this.ratesCount,
    required this.videosCount,
    required this.teacher,
    required this.videos,
  });

  var id;
  final String? name;
  final String? description;
  final String? image;
  final String? forWhich;
  var teacherId;
  var subjectId;
  final CreatedAt? createdAt;
  final DateTime? updatedAt;
  var videosSumLength;
  final String? videosSumViews;
  var ratesSumRate;
  var ratesCount;
  var videosCount;
  final Teacher? teacher;
  final List<Video> videos;

  factory Course.fromJson(Map<String, dynamic> json){
    return Course(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      forWhich: json["forWhich"],
      teacherId: json["teacher_id"],
      subjectId: json["subject_id"],
      createdAt: json["created_at"] == null ? null : CreatedAt.fromJson(json["created_at"]),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      videosSumLength: json["videos_sum_length"],
      videosSumViews: json["videos_sum_views"],
      ratesSumRate: json["rates_sum_rate"],
      ratesCount: json["rates_count"]!=0?json["rates_count"]:1,
      videosCount: json["videos_count"],
      teacher: json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
      videos: json["videos"] == null ? [] : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
    );
  }

}

class CreatedAt {
  CreatedAt({
    required this.createdAt,
    required this.createdAtDate,
  });

  final String? createdAt;
  final DateTime? createdAtDate;

  factory CreatedAt.fromJson(Map<String, dynamic> json){
    return CreatedAt(
      createdAt: json["createdAt"],
      createdAtDate: DateTime.tryParse(json["createdAtDate"] ?? ""),
    );
  }

}

class Teacher {
  Teacher({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.address,
    required this.rank,
    required this.schoolId,
    required this.subjectId,
  });

  var id;
  final String? name;
  final String? email;
  final dynamic phone;
  final String? photo;
  final dynamic address;
  var rank;
  var schoolId;
  var subjectId;

  factory Teacher.fromJson(Map<String, dynamic> json){
    return Teacher(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      photo: json["photo"],
      address: json["address"],
      rank: json["rank"],
      schoolId: json["school_id"],
      subjectId: json["subject_id"],
    );
  }

}

class Video {
  Video({
    required this.id,
    required this.name,
    required this.description,
    required this.views,
    required this.length,
    required this.video,
    required this.courseId,
    required this.createdAt,
    required this.updatedAt,
    required this.ratesSumRate,
    required this.ratesCount,
  });

  var id;
  final String? name;
  final String? description;
  var views;
  final String? length;
  final String? video;
  var courseId;
  final String? createdAt;
  final DateTime? updatedAt;
  var ratesSumRate;
  var ratesCount;

  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      views: json["views"],
      length: json["length"],
      video: json["video"],
      courseId: json["course_id"],
      createdAt: json["created_at"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      ratesSumRate: json["rates_sum_rate"],
      ratesCount: json["rates_count"]!=0?json["rates_count"]:1,
    );
  }

}
