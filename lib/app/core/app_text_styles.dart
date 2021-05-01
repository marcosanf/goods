import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle heading = GoogleFonts.montserrat(
    color: AppColors.white,
    fontSize: 32.0,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle heading16 = GoogleFonts.montserrat(
    color: AppColors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle titlePurple = GoogleFonts.montserrat(
    color: AppColors.lightPurple,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
}
