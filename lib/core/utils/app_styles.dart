import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static final textStyle16SB = GoogleFonts.montserrat(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static final textStyle14SB = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static final textStyle14M = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static final textStyle14R = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static final textStyle12R = GoogleFonts.montserrat(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static final textStyle12SB = GoogleFonts.montserrat(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );
  static final textStyle18B = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );

  static final textStyle10SB = GoogleFonts.montserrat(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
  );
  static final textStyle10R = GoogleFonts.montserrat(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
  );
  static final textStyle16M = GoogleFonts.montserrat(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static final textStyle24B = GoogleFonts.montserrat(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
}
