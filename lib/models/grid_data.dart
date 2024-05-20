import 'dart:ui';

import '../custom_assets/assets.gen.dart';
import 'grid_data_model.dart';

List<GridDataModel> gridData = [
  GridDataModel(
    image: Assets.dashboardIcon.tripleNineEmgency.path,
    title: "জরুরী সেবা",
    color1: const Color(0xffffcb49),
    color2: const Color(0xffff9800),
  ),
  GridDataModel(
    image: Assets.dashboardIcon.information.path,
    title: "তথ্য প্রদান",
    color1: const Color(0xffffcb49),
    color2: const Color(0xffff9800),
  ),
  GridDataModel(
    image: Assets.dashboardIcon.onlineComplaint.path,
    title: "অভিযোগ",
    color1: const Color(0xffffcb49),
    color2: const Color(0xffff9800),
  ),
  GridDataModel(
    image: Assets.dashboardIcon.onlineNewsPortal.path,
    title: "নিউজ পোর্টাল",
    color1: const Color(0xff88db6d),
    color2: const Color(0xff5eb650),
  ),
  GridDataModel(
    image: Assets.dashboardIcon.webPortal.path,
    title: "ওয়েব পোর্টাল",
    color1: const Color(0xff88db6d),
    color2: const Color(0xff5eb650),
  ),
  GridDataModel(
    image: Assets.dashboardIcon.contact2.path,
    title: "যোগাযোগ",
    color1: const Color(0xff88db6d),
    color2: const Color(0xff5eb650),
  ),
  GridDataModel(
    image: Assets.dashboardIcon.onlineGD.path,
    title: "অনলাইন জিডি",
    color1: const Color(0xff65efd8),
    color2: const Color(0xff1ebcc4),
  ),
  GridDataModel(
    image: Assets.dashboardIcon.policeClearanceCertificate.path,
    title: "পুলিশ ক্লিয়ারেন্স",
    color1: const Color(0xff65efd8),
    color2: const Color(0xff1ebcc4),
  ),
  GridDataModel(
    image: Assets.dashboardIcon.passport2.path,
    title: "পাসপোর্ট ভেরিফিকেশন",
    color1: const Color(0xff65efd8),
    color2: const Color(0xff1ebcc4),
  ),
  // OnboardModel(
  //   image: Assets.onboard.onboard.path,
  //   title: Strings.onboardTitle2,
  //   description: Strings.onboardDescription2,
  // ),
];
