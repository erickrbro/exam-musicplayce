import 'package:exam_musicplayce/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonStyledWidget extends StatelessWidget {
  final String label;
  final String theme;
  final Map themes = {
    "primary": Colors.blue,
    "secondary": AppColors.inputBackground,
    "transparent": Colors.transparent
  };
  final void Function() call;
  ButtonStyledWidget(
      {Key? key, required this.label, required this.call, required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      height: size.height * 0.085,
      child: ElevatedButton(
        onPressed: call,
        child: Text(label),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: themes[theme],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
