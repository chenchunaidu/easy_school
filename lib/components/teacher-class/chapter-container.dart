// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_school/components/learnings/models/subject-model.dart';
// import 'package:easy_school/components/learnings/subjects.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';

// import '../../services/app-service.dart';

// class ChapterContainer extends StatefulWidget {
//   const ChapterContainer({Key? key}) : super(key: key);

//   @override
//   _SubjectsContainerState createState() => _SubjectsContainerState();
// }

// class _SubjectsContainerState extends State<ChapterContainer> {
//   CollectionReference textbooksCollection =
//       FirebaseFirestore.instance.collection('textbooks');

//   @override
//   Widget build(BuildContext context) {
//     var student = Provider.of<AppService>(context).student;

//     return FutureBuilder(
//       future: textbooksCollection
//           .where("classId", isEqualTo: student!["classId"])
//           .get(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//         if (snapshot.hasData && snapshot.data!.size == 0) {
//           return Text("No Textbooks exist");
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("loading");
//         }

//         List<SubjectModel> subjects = snapshot.data!.docs.map((doc) {
//           var data = doc.data() as Map<String, dynamic>;
//           return SubjectModel.formJson(data, doc.id);
//         }).toList();
//         return Subjects(subjects: subjects);
//       },
//     );
//   }
// }
