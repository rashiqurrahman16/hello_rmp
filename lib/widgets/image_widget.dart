import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../custom_assets/assets.gen.dart';
import '../kmp_color/kmp_colors.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key, this.withButton = false, this.heightSize = 8.0})
      : super(key: key);

  final bool withButton;
  final double heightSize;
  final customColor = Colors.yellow;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openImageSourceOptions(context, imageController);
      },
      child: Stack(
        children: [_imageWidget(), _buttonWidget(context)],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Visibility(
      visible: widget.withButton,
      child: Positioned(
        left: 75,
        bottom: 2,
        child: IconButton(
            onPressed: () {},
            icon: Container(
              // height: 30.h,
              // width: Dimensions.widthSize * 2.4,
              // padding: EdgeInsets.all(Dimensions.paddingSize * 0.125),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: const CircleAvatar(
                backgroundColor: AppColor.kmpColor,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            )),
      ),
    );
  }

  _imageWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.kmpColor, width: 2.5)),
      child: CircleAvatar(
          backgroundColor: AppColor.kmpColor,
          backgroundImage: pickedFile == null
              ? AssetImage(Assets.dashboardIcon.profileContact.path)
              : FileImage(pickedFile!) as ImageProvider),
    );
  }

  _openImageSourceOptions(BuildContext context, controller) {
    showGeneralDialog(
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
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
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.green,
                          ),
                          onTap: () {
                            takePhoto(ImageSource.camera);
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          "From Gallery",
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.photo,
                            size: 10.h,
                            color: Colors.green,
                          ),
                          onTap: () {
                            takePhoto(ImageSource.gallery);
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          "From Camera",
                          style:
                              TextStyle(color: Colors.black, fontSize: 12.sp),
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
        });
  }

  takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    imageController.setImagePath(pickedFile!.path);
    setState(() {});
  }
}

File? pickedFile;
ImagePicker imagePicker = ImagePicker();

final imageController = Get.put(InputImageController());

class InputImageController extends GetxController {
  var isImagePathSet = false.obs;
  var imagePath = "".obs;

  void setImagePath(String path) {
    imagePath.value = path;
    isImagePathSet.value = true;
  }
}
