class TodoModel {
  final String id;
  final String description;
  final bool isCompleted;

  TodoModel(
      {required this.id, required this.description, this.isCompleted = false});
}
