// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:hello_rmp/kmp_color/kmp_colors.dart';
// import 'package:hello_rmp/widgets/text_widget.dart';
// import 'package:image_picker/image_picker.dart';
//
// class CustomButtonWidget extends StatefulWidget {
//   CustomButtonWidget(
//       {super.key,
//       required this.path,
//       required this.text,
//       this.onTap,
//       required this.color});
//
//   final String path, text;
//   void Function()? onTap;
//   Color color;
//
//   @override
//   State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
// }
//
// class _CustomButtonWidgetState extends State<CustomButtonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         _openImageSourceOptions(context, imageController);
//       },
//       child: Stack(
//         children: [
//           Container(
//             height: 38.h,
//             width: 144.w,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: widget.color, width: 1.w),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(7.r),
//               ),
//             ),
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.only(left: 25.r),
//                 child: SizedBox(
//                   width: 83.w,
//                   child: TextWidget(
//                     text: widget.text,
//                     fontSize: 12.sp,
//                     color: AppColor.textColor,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 38.h,
//             width: 43.w,
//             decoration: BoxDecoration(
//               color: widget.color,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(7.r),
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(4.50.r),
//               child: Image.asset(
//                 widget.path,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   _openImageSourceOptions(BuildContext context, controller) {
//     showGeneralDialog(
//         barrierLabel:
//             MaterialLocalizations.of(context).modalBarrierDismissLabel,
//         barrierDismissible: true,
//         barrierColor: Colors.black.withOpacity(0.6),
//         transitionDuration: const Duration(milliseconds: 700),
//         context: context,
//         pageBuilder: (_, __, ___) {
//           return Material(
//             type: MaterialType.transparency,
//             child: Align(
//               alignment: Alignment.center,
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10.r)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           child: const Icon(
//                             Icons.camera_alt,
//                             color: Colors.green,
//                           ),
//                           onTap: () {
//                             takePhoto(ImageSource.camera);
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                         Text(
//                           "From Gallery",
//                           style:
//                               TextStyle(color: Colors.white, fontSize: 12.sp),
//                         )
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           child: Icon(
//                             Icons.photo,
//                             size: 10.h,
//                             color: Colors.green,
//                           ),
//                           onTap: () {
//                             takePhoto(ImageSource.gallery);
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                         Text(
//                           "From Camera",
//                           style:
//                               TextStyle(color: Colors.black, fontSize: 12.sp),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         transitionBuilder: (_, anim, __, child) {
//           return SlideTransition(
//             position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
//                 .animate(anim),
//             child: child,
//           );
//         });
//   }
//
//   takePhoto(ImageSource source) async {
//     final pickedImage =
//         await imagePicker.pickImage(source: source, imageQuality: 100);
//
//     pickedFile = File(pickedImage!.path);
//     imageController.setImagePath(pickedFile!.path);
//     setState(() {});
//   }
// }
//
// File? pickedFile;
// ImagePicker imagePicker = ImagePicker();
//
// final imageController = Get.put(InputImageController());
//
// class InputImageController extends GetxController {
//   var isImagePathSet = false.obs;
//   var imagePath = "".obs;
//
//   void setImagePath(String path) {
//     imagePath.value = path;
//     isImagePathSet.value = true;
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/post_complain_controller.dart';
import '../kmp_color/kmp_colors.dart'; // Import your complaint controller file

class CustomButtonWidget extends StatefulWidget {
  CustomButtonWidget(
      {super.key,
      required this.path,
      required this.text,
      this.onTap,
      required this.color});

  final String path, text;
  final void Function()? onTap;
  final Color color;

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  final ComplaintController complaintController =
      Get.find<ComplaintController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openImageSourceOptions(context);
      },
      child: Stack(
        children: [
          Container(
            height: 38.h,
            width: 144.w,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: widget.color, width: 1.w),
              borderRadius: BorderRadius.all(
                Radius.circular(7.r),
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 30.r),
                child: SizedBox(
                  width: 83.w,
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColor.textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 38.h,
            width: 43.w,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.all(
                Radius.circular(7.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(4.50.r),
              child: Image.asset(
                widget.path,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _openImageSourceOptions(BuildContext context) {
    showGeneralDialog(
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Iconsax.camera,
                          color: AppColor.primaryColor,
                          size: 50.sp,
                        ),
                        onTap: () {
                          _takePhoto(ImageSource.camera);
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        "From Camera",
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Iconsax.gallery,
                          size: 50.sp,
                          color: AppColor.primaryColor,
                        ),
                        onTap: () {
                          _takePhoto(ImageSource.gallery);
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        "From Gallery",
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

  _takePhoto(ImageSource source) async {
    final pickedImage =
        await ImagePicker().pickImage(source: source, imageQuality: 100);

    if (pickedImage != null) {
      final pickedFile = File(pickedImage.path);
      complaintController
          .setImage(pickedFile); // Set the image in your controller
    }
  }
}
