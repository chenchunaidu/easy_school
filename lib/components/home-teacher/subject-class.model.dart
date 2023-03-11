class ClassModel {
  final String name;

  ClassModel({
    required this.name,
  });
}

class SubjectClassModel {
  final String subjectName;
  final List<ClassModel> classes;
  SubjectClassModel({required this.subjectName, required this.classes});
}
