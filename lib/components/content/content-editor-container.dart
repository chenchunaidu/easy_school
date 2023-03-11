import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_school/components/content/content-editor-state-model.dart';
import 'package:easy_school/components/content/content-editor.dart';
import 'package:flutter/cupertino.dart';

typedef SaveContent = void Function(ContentEditorStateModel editorState);

class ContentEditorContainer extends StatefulWidget {
  const ContentEditorContainer({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _ContentEditorContainerState createState() => _ContentEditorContainerState();
}

class _ContentEditorContainerState extends State<ContentEditorContainer> {
  CollectionReference contentCollection =
      FirebaseFirestore.instance.collection('content');

  Future<void> saveContent(ContentEditorStateModel editorState) {
    print(editorState.toJson());
    return contentCollection
        .doc(widget.id)
        .update(editorState.toJson())
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: contentCollection.doc("eT2wunqpy0jpYQyZocOo").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("No Textbooks exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          ContentEditorStateModel editorState =
              ContentEditorStateModel.fromJson(
                  snapshot.data!.data() as Map<String, dynamic>);
          return ContentEditor(
            editorState: editorState,
            saveContent: saveContent,
          );
        }
        return Text("loading");
      },
    );
  }
}
