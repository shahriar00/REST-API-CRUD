class RestApiModel {
  int userId;
  int id;
  String title;
  String body;


  RestApiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,

  });

  factory RestApiModel.fromJson(Map<String, dynamic> json) {
    return RestApiModel(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,

  };
}
