class SubjectModel {
  final String label;
  final int totalTasks;
  final int tasksCompleted;
  final String image;
  final String subjectId;

  SubjectModel(
      {required this.image,
      required this.label,
      required this.totalTasks,
      required this.tasksCompleted,
      required this.subjectId});
}
