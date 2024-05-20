import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/controllers/splash_controller.dart';
import '/widgets/text_widget.dart';
import '../custom_assets/assets.gen.dart';
import '../kmp_color/kmp_colors.dart';
import '../routes/routes.dart';
import '../widgets/footer_widget.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () {
          Get.offAllNamed(AppRoutes.dashboard);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.r, right: 12.r, top: 28.r),
              child: Column(
                children: [
                  Image.asset(
                    Assets.logo.yearLogo.path,
                    height: 102.h,
                    width: 108.w,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  TextWidget(
                    textAlign: TextAlign.center,
                    text: "স্মার্ট বাংলাদেশ: স্মার্ট পুলিশ",
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.fontColor,
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "হ্যালো আরএমপি",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFFC20E),
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(6.0, 6.0),
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.2),
                        ),
                        Shadow(
                          offset: const Offset(6.0, 6.0),
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 150.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          Assets.logo.rMPLogo.path,
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextWidget(
                    textAlign: TextAlign.center,
                    text: "রাজশাহী মেট্রোপলিটন পুলিশ",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  Text("বাংলাদেশ পুলিশ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xff2C338E),
                        fontFamily: 'SutonnyOMJ',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
