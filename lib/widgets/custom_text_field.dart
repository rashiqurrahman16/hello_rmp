import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/widgets/text_widget.dart';
import '../sizes/sizes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Color? color;
  final double focusedBorderWidth;
  final double enabledBorderWidth;
  final Color borderColor;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final String path;
  final bool isRequired;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.readOnly = false,
    this.focusedBorderWidth = 1.2,
    this.enabledBorderWidth = 1,
    this.color = Colors.white,
    required this.borderColor,
    this.suffixIcon,
    this.onTap,
    required this.path,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15.sp,
      ),
      readOnly: readOnly!,
      // style: CustomStyle.textStyle,
      controller: controller,
      keyboardType: keyboardType,
      // validator: (String? value) {
      //   if (value!.isEmpty) {
      //     return Strings.pleaseFillOutTheField;
      //   } else {
      //     return null;
      //   }
      // },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: borderColor, width: enabledBorderWidth),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 5),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          filled: true,
          fillColor: color,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding:
              const EdgeInsets.only(left: 16, right: 10, top: 1, bottom: 4),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                text: hintText,
                fontSize: Sizes.fontSize,
                fontWeight: FontWeight.w400,
                color: const Color(0xff757575),
              ),
              SizedBox(
                width: 8.w,
              ),
              isRequired
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Icon(
                        // weight: ,
                        size: 10.sp,
                        Icons.star,
                        color: Colors.red,
                      ),
                    )
                  : Container()
            ],
          ),
          prefixIcon: Image.asset(path)),
    );
  }
}
