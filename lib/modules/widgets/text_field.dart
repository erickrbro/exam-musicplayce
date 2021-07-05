import 'package:exam_musicplayce/modules/themes/app_colors.dart';
import 'package:exam_musicplayce/modules/themes/text_styles.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextEditingController textController;
  const TextFieldWidget(
      {Key? key,
      required this.label,
      required this.icon,
      required this.obscureText,
      required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: textController,
        obscureText: obscureText,
        autofocus: true,
        style: TextStyles.input,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyles.input,
            contentPadding: const EdgeInsets.all(25),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                icon,
                color: AppColors.border,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.border,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            )),
      ),
    );
  }
}
