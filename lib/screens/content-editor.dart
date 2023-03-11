import 'package:easy_school/components/content/content-editor-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContentEditor extends StatelessWidget {
  const ContentEditor({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return ContentEditorContainer(
      id: id,
    );
  }
}
