class Posts {
  Posts({
    required this.status,
    required this.posts,
  });

  final String? status;
  final List<Post> posts;

  factory Posts.fromJson(Map<String, dynamic> json){
    return Posts(
      status: json["status"],
      posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
    );
  }

}

class Post {
  Post({
    required this.id,
    required this.body,
    required this.likes,
    required this.dislikes,
    required this.studentId,
    required this.createdAt,
    required this.updatedAt,
    required this.commentsCount,
    required this.comments,
    required this.student,
    required this.postId,
  });

  final int? id;
  final String? body;
  final int? likes;
  final int? dislikes;
  final int? studentId;
  final String? createdAt;
  final DateTime? updatedAt;
  final int? commentsCount;
  final List<Post> comments;
  final Student? student;
   var postId;

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json["id"],
      body: json["body"],
      likes: json["likes"],
      dislikes: json["dislikes"],
      studentId: json["student_id"],
      createdAt: json["created_at"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      commentsCount: json["comments_count"],
      comments: json["comments"] == null ? [] : List<Post>.from(json["comments"]!.map((x) => Post.fromJson(x))),
      student: json["student"] == null ? null : Student.fromJson(json["student"]),
      postId: json["post_id"],
    );
  }

}

class Student {
  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.address,
    required this.rank,
    required this.schoolId,
    required this.roomId,
    required this.parentId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? email;
  final dynamic phone;
  final String? photo;
  final dynamic address;
  final int? rank;
  final dynamic schoolId;
  final dynamic roomId;
  final dynamic parentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Student.fromJson(Map<String, dynamic> json){
    return Student(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      photo: json["photo"],
      address: json["address"],
      rank: json["rank"],
      schoolId: json["school_id"],
      roomId: json["room_id"],
      parentId: json["parent_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
