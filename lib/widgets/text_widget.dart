import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../kmp_color/kmp_colors.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.maxLines,
    this.color = AppColor.fontColor,
    this.textAlign = TextAlign.center,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  final Color color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
