class TodoModel {
  final String id;
  final String userId;
  final String title;
  final String description;
  final bool completed;
  TodoModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.completed,
  });
  factory TodoModel.fromJson(final Map<String, dynamic> json) => TodoModel(
        id: json['id'] ?? "null",
        userId: json['userId'] ?? "null",
        title: json['title'] ?? "null",
        description: json['description'] ?? "null",
        completed: json['completed'] ?? false,
      );
}
