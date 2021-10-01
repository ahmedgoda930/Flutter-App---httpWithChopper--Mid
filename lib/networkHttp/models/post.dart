class Post {
  int? userId;
  int? id;
  String? title;
  String? body;
  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> post) {
    return Post(
      userId: post['userId'],
      id: post['id'],
      title: post['title'],
      body: post['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}
