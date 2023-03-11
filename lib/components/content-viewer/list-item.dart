import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/content/custom-editable-text.dart';
import 'package:flutter/widgets.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, this.text}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTypography("\u2022 "),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: CustomTypography(text ?? ""))
      ],
    );
  }
}
