import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/widgets/text_widget.dart';

class CustomButtonWidget2 extends StatelessWidget {
  const CustomButtonWidget2(
      {super.key, required this.text, required this.color, this.onTap});

  final String text;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 38.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(7.r),
          ),
          color: color,
        ),
        child: Center(
          child: TextWidget(
            textAlign: TextAlign.center,
            text: text,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
