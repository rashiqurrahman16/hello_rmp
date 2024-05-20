import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridItemWidget extends StatelessWidget {
  GridItemWidget(
      {super.key, required this.path, required this.text, this.onTap});

  final String path, text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(7.r),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffffc600), Color(0xff01a9ac)],
          ),
        ),
        // height: 104.h,
        // width: 87.w,
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  // padding: EdgeInsets.only(bottom: 6.r, top: 8.r),
                  height: 46.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.r, right: 6.r),
                  child: const Divider(color: Colors.white, height: 4),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  // heightFactor: 10.h,
                  child: Text(
                    text,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
