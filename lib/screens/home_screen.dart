// // ignore_for_file: avoid_types_as_parameter_names
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
//
// import '/kmp_color/kmp_colors.dart';
// import '/models/grid_data.dart';
// import '/routes/routes.dart';
// import '/widgets/grid_item_widget.dart';
// import '../custom_assets/assets.gen.dart';
// import '../widgets/custom_app_bar.dart';
// import '../widgets/new_grid_item_widget.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.primaryColor,
//       appBar: CustomAppBar(
//         title: '',
//       ),
//       body: _bodyWidget(context),
//     );
//   }
//
//   _bodyWidget(BuildContext context) {
//     return SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.only(left: 20.r, right: 20.r),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Container(
//                   height: 78.h,
//                   width: MediaQuery.of(context).size.width * 0.8805,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(7.r),
//                     ),
//                     image: const DecorationImage(
//                         image: NetworkImage(
//                           'https://c8.alamy.com/comp/2B74P80/father-nation-of-bangladesh-bangabandhu-sheikh-mujibur-rahman-2B74P80.jpg',
//                         ),
//                         fit: BoxFit.cover),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 _gridViewWidget(context),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 _carouselSliderWidget(context),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 _smallGridView(context),
//                 SizedBox(
//                   height: 40.h,
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
//
//   //grid view
//   _gridViewWidget(BuildContext context) {
//     return Container(
//       height: 355.h,
//       padding: EdgeInsets.all(12.r),
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColor.fontColor),
//         borderRadius: BorderRadius.all(
//           Radius.circular(7.r),
//         ),
//       ),
//       child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             mainAxisSpacing: 8.0,
//             crossAxisSpacing: 8.0,
//             childAspectRatio: 4 / 5,
//           ),
//           itemCount: 9,
//           itemBuilder: (BuildContext, int index) {
//             return GridItemWidget(
//               onTap: () {
//                 switch (index) {
//                   case 0:
//                     Get.toNamed(AppRoutes.infoForm);
//                     break;
//                   case 1:
//                     Get.toNamed(AppRoutes.complainForm);
//                     break;
//                   case 2:
//                     break;
//                   case 3:
//                     break;
//                 }
//               },
//               path: gridData[index].image,
//               text: gridData[index].title,
//             );
//           }),
//     );
//   }
//
//   _carouselSliderWidget(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         // enlargeCenterPage: true,
//         aspectRatio: MediaQuery.of(context).size.width,
//         viewportFraction: 1,
//         autoPlay: true,
//         clipBehavior: Clip.none,
//         height: 80.h,
//         autoPlayAnimationDuration: const Duration(milliseconds: 10),
//       ),
//       items: [1, 2, 3, 4, 5].map((i) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(Assets.logo.cybe.path),
//                     fit: BoxFit.cover),
//               ),
//             );
//           },
//         );
//       }).toList(),
//     );
//   }
//
// //information list
//   _smallGridView(BuildContext context) {
//     return Container(
//       height: 182.h,
//       padding: EdgeInsets.all(12.r),
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColor.fontColor),
//         borderRadius: BorderRadius.all(
//           Radius.circular(7.r),
//         ),
//       ),
//       child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 8.0,
//             crossAxisSpacing: 8.0,
//             childAspectRatio: 4 / 3,
//           ),
//           itemCount: 6,
//           itemBuilder: (BuildContext, int index) {
//             return NewGridItemWidget(
//               path: gridData[index].image,
//               text: gridData[index].title,
//             );
//           }),
//     );
//   }
// }
