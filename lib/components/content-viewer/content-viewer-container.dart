import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_school/components/content-viewer/content-model.dart';
import 'package:easy_school/components/content-viewer/content-viewer.dart';
import 'package:flutter/widgets.dart';

class ContentViewerContainer extends StatelessWidget {
  const ContentViewerContainer({Key? key, required this.contentId})
      : super(key: key);

  final String contentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference contentCollection =
        FirebaseFirestore.instance.collection('content');
    return FutureBuilder<DocumentSnapshot>(
      future: contentCollection.doc(contentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("No content exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          ContentViewerModel content = ContentViewerModel.fromJson(
              snapshot.data!.data() as Map<String, dynamic>);
          return ContentViewer(
            content: content,
          );
        }
        return Text("loading");
      },
    );
  }
}
