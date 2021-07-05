import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class TextStyles {
  static final title = GoogleFonts.roboto(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: AppColors.title,
  );
  static final subtitle = GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w300,
    color: AppColors.title,
  );
  static final input = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppColors.input,
  );
  static final caption = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.input,
  );
  static final checkbox = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.subtitle,
  );
}
