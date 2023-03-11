import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_school/components/common/full-page-caurosel.dart';
import 'package:easy_school/components/content-viewer/content-viewer-container.dart';
import 'package:flutter/widgets.dart';

class Activities extends StatelessWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference contentCollection =
        FirebaseFirestore.instance.collection('content');
    // return FullPageCarousel(children: []);
    return FutureBuilder<QuerySnapshot>(
      future: contentCollection.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && snapshot.data!.size == 0) {
          return Text("No content exist");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading");
        }
        List<Widget> contents = snapshot.data!.docs
            .map((e) => ContentViewerContainer(contentId: e.id))
            .toList();
        return FullPageCarousel(
          children: contents,
        );
      },
    );
  }
}
