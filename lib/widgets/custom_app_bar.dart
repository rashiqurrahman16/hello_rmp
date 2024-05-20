import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_assets/assets.gen.dart';
import '../kmp_color/kmp_colors.dart';
import '../sizes/sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 115.h;
  final String title;

  CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
            color: Colors.yellow,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Sizes.radius),
              bottomRight: Radius.circular(Sizes.radius),
            ),
          ),
          height: height * 1.03,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Sizes.radius),
              bottomRight: Radius.circular(Sizes.radius),
            ),
          ),
          height: height,
          child: Padding(
            padding: EdgeInsets.only(top: 38.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Image.asset(
                    Assets.logo.rMPLogo.path,
                    height: 48.h,
                    width: 48.w,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "রাজশাহী মেট্রোপলিটন পুলিশ",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        "বাংলাদেশ পুলিশ",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2C338E),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
