import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_rmp/widgets/text_widget.dart';

import '../sizes/sizes.dart';

class DashboardItemWidget extends StatelessWidget {
  DashboardItemWidget(
      {super.key, required this.path, required this.text, this.onTap});

  final String path, text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: _contentWidget(context),
    );
  }

  //image content
  _contentWidget(BuildContext context) {
    return Container(
      width: 87.w,
      // height: MediaQuery.sizeOf(context).height * 0.2,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff00FBFF), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(color: const Color(0xff2C338E)),
          borderRadius: BorderRadius.all(
            Radius.circular(6.r),
          ),
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(7.0.r),
        child: Padding(
          padding: EdgeInsets.all(2.0.r),
          child: Column(
            children: [
              Container(
                height: 46.h,
                width: 55.w,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(path))),
              ),
              const Divider(
                color: Color(0xff2C338E),
              ),
              _textWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  //text
  _textWidget(BuildContext context) {
    return TextWidget(
      text: text,
      fontSize: Sizes.gridFont,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
