import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_assets/assets.gen.dart';
import '../kmp_color/kmp_colors.dart';
import '../widgets/custom_app_bar.dart';

class UnderMaintanceScreen extends StatelessWidget {
  const UnderMaintanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: CustomAppBar(
        title: '',
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.8722,
            height: MediaQuery.sizeOf(context).height * 0.2894,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(Assets.dashboardIcon.underDevelopment.path),
              ),
            ),
          ),
          SizedBox(
            height: 45.42.h,
          ),
          const Text(
            "দুঃখিত!",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const Text("এই সেবাটি শীঘ্রই আসছে",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white))
        ],
      ),
    );
  }
}
