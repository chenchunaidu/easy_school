import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/content/block-model.dart';
import 'package:easy_school/components/content/content-buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'content-editor.dart';

class ContentButton extends StatelessWidget {
  const ContentButton({Key? key, required this.button, required this.addBlock})
      : super(key: key);

  final ContentButtonModel button;
  final AddBlockCallback addBlock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          addBlock(button);
        },
        child: Container(
          height: 40,
          alignment: Alignment.center,
          child: CustomTypography(
            button.label,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(6)),
        ));
  }
}
