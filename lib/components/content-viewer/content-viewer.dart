import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_school/components/content-viewer/content-model.dart';
import 'package:flutter/widgets.dart';

class ContentViewer extends StatelessWidget {
  const ContentViewer({Key? key, required this.content}) : super(key: key);

  final ContentViewerModel content;

  @override
  Widget build(BuildContext context) {
    CollectionReference contentCollection =
        FirebaseFirestore.instance.collection('content');
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: content.blocks.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: content.blocks[index].getBlock());
          }),
    );
  }
}
