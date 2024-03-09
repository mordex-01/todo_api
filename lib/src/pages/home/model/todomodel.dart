class TodoModel {
  final String id, userId;
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
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        description: json['description'],
        completed: json['completed'],
      );
}
