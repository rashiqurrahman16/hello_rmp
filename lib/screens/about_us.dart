import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../custom_assets/assets.gen.dart';
import '../kmp_color/kmp_colors.dart';
import '../routes/routes.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
        child: Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: AppColor.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: 29.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(14.r),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 6, bottom: 6),
                      child: Column(
                        children: [
                          Image.asset(
                            Assets.logo.rMPLogo.path,
                            height: 55,
                            width: 55,
                          ),
                          Text("Hello RMP",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.2252836227417.sp,
                                fontWeight: FontWeight.w600,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text("Hello RMP APP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 31.527957916259766.sp,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.termsAndCondition);
                },
                child: const Text("Terms & Conditions",
                    style: TextStyle(
                      color: AppColor.faqTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.privacy);
                },
                child: const Text("Privacy & Policy",
                    style: TextStyle(
                      color: AppColor.faqTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                  textAlign: TextAlign.center,
                  "Copyright 2023 RMP Metropolitan Police\n All rights reversed.\n Version: 1.0.0",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                Assets.logo.desktopItLogo,
                height: 50.h,
                width: 93.w,
                // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
              ),
              const SizedBox(
                height: 5,
              ),
              Text("147/C Green Road, Dhaka-1205.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 5,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: 225,
                    height: 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("Contacts",
                          style: TextStyle(
                            color: AppColor.faqTextColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  textAlign: TextAlign.center,
                  "Hotline: 09 609 800 800 \nGeneral: +880 1913 800 800 \nSales: +880 1913 800 850 \nAccounts: +880 1913 800 840\nSupport: +880 1913 800 848\nIndia Cell: +91 8583 045210\nUSA Cell: +1 913 800 6999",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                height: 5,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: 225,
                    height: 1,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text("Emails",
                          style: TextStyle(
                            color: AppColor.faqTextColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              // Text("Emails",
              //     style: TextStyle(
              //       fontSize: 9,
              //       color: Colors.white,
              //       fontWeight: FontWeight.w500,
              //     )),
              Text(
                  textAlign: TextAlign.center,
                  "info@desktopit.net\nsupport@desktopit.net",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
              SizedBox(
                height: 5,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: 225,
                    height: 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("Websites",
                          style: TextStyle(
                            color: AppColor.faqTextColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  textAlign: TextAlign.center,
                  "www.desktopit.net\nwww.desktopit.com.bd",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                height: 29.h,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
