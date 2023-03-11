import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/content-viewer/content-viewer-container.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentViewerContainer(
      contentId: "",
    );
  }
}
