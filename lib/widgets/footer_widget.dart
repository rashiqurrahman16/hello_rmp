import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../custom_assets/assets.gen.dart';
import '../kmp_color/kmp_colors.dart';
import '../routes/routes.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.aboutUs);
      },
      child: Column(
        children: [
          _dividerWidget(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Developed by:",
                  style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w400,
                      color: AppColor.fontColor)),
              SizedBox(
                width: 8.w,
              ),
              SvgPicture.asset(
                Assets.logo.desktopItLogo,
                height: 25.84.h,
                width: 93.w,
                // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }

// divider for footer
  _dividerWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.r,
        right: 12.r,
      ),
      child: const Divider(
        color: AppColor.fontColor,
        thickness: 1,
      ),
    );
  }
}
