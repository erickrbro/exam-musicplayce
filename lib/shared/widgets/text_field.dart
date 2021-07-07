import 'package:exam_musicplayce/shared/themes/app_colors.dart';
import 'package:exam_musicplayce/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController textController;
  final int? maxLines;
  String? Function(String?)? validator;
  TextFieldWidget(
      {Key? key,
      this.label,
      this.icon,
      required this.obscureText,
      required this.textController,
      this.maxLines,
      this.validator})
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
        maxLines: maxLines == null ? 1 : maxLines,
        validator: validator,
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
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
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
