import 'package:easy_school/components/common/typography/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddSubject extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTypography("Subject name"),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: _controller,
            ),
            SizedBox(
              height: 6,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: const CustomTypography(
                    'Submit',
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Use the text entered in the TextField
                    print(_controller.text);
                  },
                )),
          ],
        ));
  }
}
