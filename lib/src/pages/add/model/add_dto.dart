class AddDto {
  AddDto({
    required this.userId,
    required this.title,
    required this.description,
    required this.completed,
  });

  final String userId;
  final String title;
  final String description;
  final bool completed;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'title': title,
        'description': description,
        'completed': completed,
      };
}
