class Cources {
  Cources({
    required this.status,
    required this.courses,
  });

  final String? status;
  final List<Course> courses;

  factory Cources.fromJson(Map<String, dynamic> json){
    return Cources(
      status: json["status"],
      courses: json["courses"] == null ? [] : List<Course>.from(json["courses"]!.map((x) => Course.fromJson(x))),
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
    required this.ratesCount,
    required this.videosSumLength,
    required this.ratesSumRate,
    required this.videosCount,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final String? forWhich;
  final int? teacherId;
  final int? subjectId;
  final CreatedAt? createdAt;
  final DateTime? updatedAt;
  final int? ratesCount;
  final int? videosSumLength;
   var ratesSumRate;
  final int? videosCount;

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
      ratesCount: json["rates_count"],
      videosSumLength: json["videos_sum_length"],
      ratesSumRate: json["rates_sum_rate"],
      videosCount: json["videos_count"],
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
