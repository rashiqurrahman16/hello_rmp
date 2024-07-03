import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../kmp_color/kmp_colors.dart';
import '../../models/grid_data.dart';
import '../../routes/routes.dart';
import '../../widgets/dashboard_item_widget.dart';
import '../../widgets/new_grid_item_widget.dart';
import '../backend/model/app_slider_model.dart';
import '../backend/model/weather_api_model.dart';
import '../controllers/home_controller.dart';
import '../custom_assets/assets.gen.dart';
import '../sizes/sizes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/footer_widget.dart';
import '../widgets/text_widget.dart';

// void launchFacebook() async {
//   const facebookScheme = 'fb://'; // Facebook app custom scheme
//   const facebookURL =
//       'https://www.facebook.com/kmpkhulna?mibextid=ZbWKwL'; // Facebook website URL
//
//   try {
//     // Try to open the Facebook app using the custom scheme
//     if (await canLaunchUrl(facebookScheme)) {
//       await launch(facebookScheme);
//     } else {
//       // If the app is not installed, open Facebook in a web browser
//       await launch(facebookURL);
//     }
//   } catch (e) {
//     print('Error launching Facebook: $e');
//   }
// }

final Uri _url =
    Uri.parse('https://www.facebook.com/RangpurMetropolitanPolice?_rdc=1&_rdr');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

final Uri _youtubeUrl =
    Uri.parse('https://www.youtube.com/channel/UC2S-2CYe4NinjUV1Eq-vWBw');

Future<void> _youtubeURL() async {
  if (!await launchUrl(_youtubeUrl)) {
    throw Exception('Could not launch $_url');
  }
}

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final controller = Get.put(HomeController());

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
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.r, right: 20.r),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Obx(() {
                  if (controller.appBanner.value.status == 200) {
                    return Container(
                      height: 78.h,
                      width: MediaQuery.of(context).size.width * 0.8805,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                              controller.appBanner.value.data,
                            ),
                            fit: BoxFit.cover),
                      ),
                    );
                  } else {
                    return TextWidget(
                        text: 'Loading..', fontSize: Sizes.fontSize);
                  }
                }),
                SizedBox(
                  height: 15.h,
                ),
                _gridViewWidget(context),
                SizedBox(
                  height: 15.h,
                ),
                Obx(() {
                  if (controller.sliders.isNotEmpty) {
                    return _carouselSliderWidget(context, controller.sliders);
                  } else {
                    return TextWidget(
                      text: "Loading...",
                      fontSize: 15.sp,
                    ); // You can use a loading indicator here.
                  }
                }),
                SizedBox(
                  height: 15.h,
                ),
                _smallGridView(context),
                SizedBox(
                  height: 15.h,
                ),
                _rowSocialMediaWidget(context),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          FooterWidget(),
        ],
      ),
    );
  }

  //grid view
  _gridViewWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.fontColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5.0.w,
            crossAxisSpacing: 5.0.h,
            childAspectRatio: 4 / 5,
          ),
          itemCount: 9,
          itemBuilder: (BuildContext, int index) {
            return DashboardItemWidget(
              onTap: () {
                switch (index) {
                  case 1:
                    Get.toNamed(AppRoutes.infoForm);
                    break;
                  case 2:
                    Get.toNamed(AppRoutes.complainForm);
                    break;
                  case 0:
                    controller.launchDialer("999");
                    break;

                  case 3:
                    Get.toNamed(AppRoutes.onlineNewsPortal,
                        arguments:
                            "https://rmp.gov.bd/news");
                    break;
                  case 4:
                    Get.toNamed(AppRoutes.onlineNewsPortal,
                        arguments: "https://rmp.gov.bd/home");
                    break;
                  case 5:
                    Get.toNamed(AppRoutes.onlineNewsPortal,
                        arguments:
                            "https://rmp.gov.bd/contact-us");
                    break;
                  case 6:
                    Get.toNamed(AppRoutes.onlineNewsPortal,
                        arguments: "https://gd.police.gov.bd/");
                    break;
                  case 7:
                    Get.toNamed(AppRoutes.onlineNewsPortal,
                        arguments: "https://pcc.police.gov.bd/ords/f?p=500:1");
                    break;
                  case 8:
                    Get.toNamed(AppRoutes.onlineNewsPortal,
                        arguments:
                            "https://www.epassport.gov.bd/authorization/application-status");
                    break;
                }
              },
              path: gridData[index].image,
              text: gridData[index].title,
            );
          }),
    );
  }

  _carouselSliderWidget(BuildContext context, List<AppSliderModel> sliders) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: MediaQuery.of(context).size.width,
        viewportFraction: 1,
        autoPlay: true,
        clipBehavior: Clip.none,
        height: 80.h,
        autoPlayInterval: const Duration(seconds: 10),

        // autoPlayAnimationDuration: const Duration(microseconds: 300),
      ),
      items: sliders.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                image: DecorationImage(
                  image: NetworkImage(slider.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

//information list
  _smallGridView(BuildContext context) {
    return Container(
      // height: 178.h,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.fontColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: Column(
        children: [
          _rowWidget(
              context,
              Assets.dashboardIcon.weather.path,
              Assets.dashboardIcon.trafic.path,
              'আজকের আবহাওয়া',
              'ট্রাফিক আপডেট', () {
            Get.toNamed(AppRoutes.onlineNewsPortal,
                arguments:
                    "https://www.accuweather.com/en/bd/rajshahi/1-30529_1_al/weather-forecast/1-30529_1_al?city=r%C4%81jsh%C4%81hi");
            // _openDialog(context, controller.weatherData.value);
          }, () {
            Get.toNamed(AppRoutes.onlineNewsPortal,
                arguments:
                    "https://www.google.com/maps/place/Rajshahi/@24.3748422,88.603075,12.5z/data=!4m6!3m5!1s0x39fbefa96a38d031:0x10f93a950ed6f410!8m2!3d24.3746497!4d88.6003665!16zL20vMDR2MDc2!5m1!1e1?entry=ttu");
          }),
          SizedBox(
            height: 12.h,
          ),
          _rowWidget(
              context,
              Assets.dashboardIcon.something.path,
              Assets.dashboardIcon.laws.path,
              'সাধারণ জিজ্ঞাসা',
              'আইন ও বিধি', () {
            Get.toNamed(AppRoutes.faq);
          }, () {
            Get.toNamed(AppRoutes.underMaintenance);
          }),
          SizedBox(
            height: 12.h,
          ),
          _newRowWidget(context),
        ],
      ),
    );
  }

  // 'আজকের আবহাওয়া'
  // 'ট্রাফিক আপডেট'

  _rowWidget(BuildContext context, String path1, path2, text1, text2,
      void Function()? onTap1, onTap2) {
    return Row(
      children: [
        Expanded(
          child: NewGridItemWidget(
            path: path1,
            text: text1,
            onTap: onTap1,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: NewGridItemWidget(
            path: path2,
            text: text2,
            onTap: onTap2,
          ),
        ),
      ],
    );
  }

  //

  _newRowWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.importantPhoneNumber);
            },
            child: Container(
              height: 43.h,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.r),
                ),
                color: Colors.white,
              ),
              // height: 104.h,
              // width: 87.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 6.r),
                    height: 28.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      image: DecorationImage(
                          image: AssetImage(Assets.dashboardIcon.contact.path),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Container(
                    height: double.infinity,

                    width: 83.w,
                    decoration: BoxDecoration(
                      color: AppColor.kmpColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.r),
                      ),
                    ),
                    // margin: EdgeInsets.only(right: 5.r),
                    child: Padding(
                      padding: EdgeInsets.all(7.0.r),
                      child: Center(
                        child: TextWidget(
                          text: 'জরুরী ফোন নম্বর',
                          fontSize: Sizes.gridFont,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.underMaintenance);
              // launchFacebook();
              // Get.toNamed(AppRoutes.onlineNewsPortal,
              //     arguments: "https://www.facebook.com/kmpkhulna/");
            },
            child: Container(
              height: 43.h,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.r),
                ),
                color: Colors.white,
              ),
              // height: 104.h,
              // width: 87.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 6.r),
                    height: 28.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      image: DecorationImage(
                          image:
                              AssetImage(Assets.dashboardIcon.protection.path),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Container(
                    height: double.infinity,

                    width: 83.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF0000),
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.r),
                      ),
                    ),
                    // margin: EdgeInsets.only(right: 5.r),
                    child: Center(
                      child: TextWidget(
                        text: 'সুরক্ষা',
                        fontSize: Sizes.gridFont,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Function to show weather data in a pop-up dialog
  void _openDialog(BuildContext context, WeatherApiGetModel? weatherData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.35,
          child: AlertDialog(
            title: const Text('Weather Data'),
            content: weatherData != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('City: ${weatherData.name}'),
                      Text('Temperature: ${weatherData.main.temp}°C'),
                      Text('Weather: ${weatherData.weather[0].main}'),
                      Text('Weather: ${weatherData.weather[0].icon}'),
                      // Add more weather details here
                    ],
                  )
                : const Text(
                    'No weather data available'), // Handle no data case
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  //social media links

  _rowSocialMediaWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 70.r, right: 70.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                _launchUrl();
              },
              child: Image.asset(Assets.dashboardIcon.facebook.path)),
          GestureDetector(
              onTap: () {
                _youtubeURL();
              },
              child: Image.asset(Assets.dashboardIcon.youTube.path)),
          Image.asset(Assets.dashboardIcon.linkedIn.path),
          Image.asset(Assets.dashboardIcon.x.path),
        ],
      ),
    );
  }
}
