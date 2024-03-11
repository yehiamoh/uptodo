class TaskModel {
  final String author;
  final String title;
  final String content;

  TaskModel({
    required this.author,
    required this.title,
    required this.content,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        author: json["author"],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson(Map<String, String> map) =>
      {"author": author, "title": title, "content": content};
}
