import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:path_provider/path_provider.dart';

import '../controllers/give_info_controller.dart';
import '../kmp_color/kmp_colors.dart';

class PdfPickerInfo extends StatelessWidget {
  PdfPickerInfo(
      {super.key,
      required this.text,
      required this.color,
      this.onTap,
      required this.path});

  final String text;
  final Color color;
  final String path;
  void Function()? onTap;
  final controller = Get.put(GiveInfoController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        try {
          final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['pdf'],
              withData: true);

          if (result != null) {
            debugPrint("working pdf ===========================>");
            final fileBytes = result.files.first.bytes;
            final fileName = result.files.first.name;

            if (fileBytes != null) {
              debugPrint("working pdf 2 ===========================>");
              // Specify a directory where you want to save the PDF file.
              final directory = await getApplicationDocumentsDirectory();
              final filePath = '${directory.path}/$fileName';

              final file = File(filePath);
              controller.setFile(file);
              await file.writeAsBytes(fileBytes as List<int>);

              // Send the file to the controller (if needed).
            } else {
              debugPrint("not working pdf 2 ===========================>");
            }
          } else {
            debugPrint("not working pdf ===========================>");
          }
        } catch (e) {
          // Handle any exceptions here.
          print('Error: $e');
        }

        // final result = await FilePicker.platform.pickFiles(
        //   type: FileType.custom,
        //   withData: true,
        //   allowMultiple: true,
        //   withReadStream: true,
        //   allowedExtensions: ['pdf'],
        // );
        // if (result != null) {
        //   Uint8List? fileBytes = result.files.first.bytes;
        //   String fileName = result.files.first.name;
        //
        //   // Convert Uint8List to List<int>
        //   // final fileBytesList = fileBytes?.toList();
        //   // final fileBytesList = fileBytes?.toList();
        //   final fileBytesList = fileBytes?.cast<int>();
        //   if (fileBytesList != null) {
        //     debugPrint("Working pdf 🍏🌟🌟🎶😉");
        //     final file = File(fileName);
        //
        //     await file.writeAsBytes(fileBytesList);
        //     controller.setFile(file);
        //   } else {
        //     debugPrint("not Working pdf 🍏🌟🌟🎶😉");
        //   }
        //   // final fileBytesList = fileBytes ?? Uint8List.fromList([]);
        //
        //   // final file = File(fileName);
        //   // await file.writeAsBytes(fileBytesList!);
        //   //
        //   // // Send the file to the controller.
        //   // controller.setFile(file);
        // }
      },
      child: Stack(
        children: [
          Container(
            height: 38.h,
            width: 144.w,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: color, width: 1.w),
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
                    text,
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
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(7.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(4.50.r),
              child: Image.asset(
                path,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
