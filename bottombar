// DashboardController

import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs; 
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}

// Bottom Bar

import 'package:cricheros/Controller/Home/dashboard_controller.dart';
import 'package:cricheros/core/utils/constant/app_color.dart';
import 'package:cricheros/core/utils/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final controller = Get.find<DashboardController>();

  final List<String> icons = [
    AppImages.home, // Icons.home_filled,
    AppImages.building, // Icons.apartment,
    AppImages.profile, // Icons.person_outline,
    AppImages.setting, // Icons.settings,
  ];

  final List<String> labels = ["Home", "Match", "Profile", "Setting"];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = controller.selectedIndex.value == index;
            return GestureDetector(
              onTap: () => controller.changeTabIndex(index),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Color(0XFFF4F1FD) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      icons[index],
                      color:
                          isSelected
                              ? AppColors.primaryColor
                              : Color(0xFF9DB2CE),
                    ),
                    const SizedBox(width: 6),
                    if (isSelected)
                      Text(
                        labels[index],
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
            );
          }), 


// DashboardScreen

import 'package:cricheros/Controller/Home/dashboard_controller.dart';
import 'package:cricheros/screens%20views/Home/career_page.dart';
import 'package:cricheros/screens%20views/Home/edit_profile.dart';
import 'package:cricheros/screens%20views/Home/home_screen.dart';
import 'package:cricheros/screens%20views/Home/match_setup.dart';
import 'package:cricheros/screens%20widgets/Home%20Widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  final screens = [HomeScreen(), CareerPage(), EditProfile(), MatchSetup()];

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

        ),
      ),
    );
  }
}
