import 'package:exam_musicplayce/modules/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonStyledWidget extends StatelessWidget {
  final String label;
  final void Function() call;
  const ButtonStyledWidget({Key? key, required this.label, required this.call})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 20),
      child: SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.085,
        child: ElevatedButton(
          onPressed: call,
          child: Text(label),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
        ),
      ),
    );
  }
}
