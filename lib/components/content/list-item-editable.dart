import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/content/custom-editable-text.dart';
import 'package:flutter/widgets.dart';

import 'content-editor.dart';
import 'custom-editable-text-model.dart';

class ListItemEditable extends StatelessWidget {
  const ListItemEditable(
      {Key? key, this.props, required this.onFocus, required this.onUpdate})
      : super(key: key);

  final CustomEditableTextModel? props;
  final void Function() onFocus;
  final UpdateBlockCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTypography("\u2022 "),
        Expanded(
            child: CustomEditableText(
          onFocus: onFocus,
          onUpdate: onUpdate,
          props: props,
        ))
      ],
    );
  }
}
