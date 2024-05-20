import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/kmp_color/kmp_colors.dart';
import '../controllers/give_info_controller.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({
    Key? key,
    required this.isChecked,
  }) : super(key: key);
  final RxBool isChecked;
  final controller = Get.put(GiveInfoController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(7.r),
      onTap: () {
        isChecked.value = !isChecked.value;

        if (isChecked.value == false) {
          controller.hideStatus = 1;
          debugPrint("testing hide status ${controller.hideStatus.toString()}");
        } else {
          controller.hideStatus = 0;
          debugPrint("testing hide status ${controller.hideStatus.toString()}");
        }
      },
      child: Obx(
        () => Container(
          height: 16.h,
          width: 16.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isChecked.value ? Colors.white : AppColor.kmpColor,
              border: Border.all(
                width: 1,
                color: Colors.black,
              )),
          child: isChecked.value
              ? Container()
              : const Icon(
                  weight: 4,
                  Icons.check,
                  size: 14,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
