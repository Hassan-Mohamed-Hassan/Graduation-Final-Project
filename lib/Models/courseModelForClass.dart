class Course {
  final int id;
  final int courseId;
  final int roomId;
  final int ratesCount;
   var videosCount;
  dynamic ratesSumRate;
  final int? videosSumLength;
  final CourseDetails courseDetails;

  Course({
    required this.id,
    required this.courseId,
    required this.roomId,
    required this.ratesCount,
    required this.videosCount,
    this.ratesSumRate,
    this.videosSumLength,
    required this.courseDetails,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      courseId: json['course_id'],
      roomId: json['room_id'],
      ratesCount: json['rates_count'],
      videosCount: json['videos_count'],
      ratesSumRate: json['rates_sum_rate']==null?0:json['rates_sum_rate'],
      videosSumLength: json['videos_sum_length'],
      courseDetails: CourseDetails.fromJson(json['course']),
    );
  }
}

class CourseDetails {
  final int id;
  final String name;
  final String description;
  final String image;
  final String forWhich;
  final int teacherId;
  final int subjectId;
  final CreatedAt createdAt;
  final String updatedAt;

  CourseDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.forWhich,
    required this.teacherId,
    required this.subjectId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseDetails.fromJson(Map<String, dynamic> json) {
    return CourseDetails(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      forWhich: json['forWhich'],
      teacherId: json['teacher_id'],
      subjectId: json['subject_id'],
      createdAt: CreatedAt.fromJson(json['created_at']),
      updatedAt: json['updated_at'],
    );
  }
}

class CreatedAt {
  final String createdAt;
  final String createdAtDate;

  CreatedAt({
    required this.createdAt,
    required this.createdAtDate,
  });

  factory CreatedAt.fromJson(Map<String, dynamic> json) {
    return CreatedAt(
      createdAt: json['createdAt'],
      createdAtDate: json['createdAtDate'],
    );
  }
}

class CourseClassResponse {
  final String status;
  final List<Course> courses;

  CourseClassResponse({
    required this.status,
    required this.courses,
  });

  factory CourseClassResponse.fromJson(Map<String, dynamic> json) {
    var courseList = json['courses'] as List<dynamic>;
    List<Course> courses = courseList.map((course) => Course.fromJson(course)).toList();

    return CourseClassResponse(
      status: json['status'],
      courses: courses,
    );
  }
}