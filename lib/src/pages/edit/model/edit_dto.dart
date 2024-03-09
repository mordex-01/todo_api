class EditDto {
  EditDto({
    required this.userId,
    required this.title,
    required this.description,
    required this.isCheck,
  });
  final String userId;
  final String title;
  final String description;
  final bool isCheck;
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'title': title,
        'description': description,
        "completed": isCheck,
      };
}
// {
//       "id": "b12b",
//       "userId": "asd",
//       "title": "asd",
//       "description": "asd",
//       "completed": false
//     },