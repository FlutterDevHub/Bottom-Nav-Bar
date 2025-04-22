import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social/core/utils/Themes/app_color.dart';
import 'package:social/core/utils/Themes/app_images.dart';
import 'package:social/scr/Message/message.dart';
import 'package:social/scr/Notification/notification.dart';
import 'package:social/scr/Profile/profile.dart';
import 'package:social/scr/home.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  _BottomBarCusState createState() => _BottomBarCusState();
}

class _BottomBarCusState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  final List<Widget> classes = [
    HomeScreen(),
    MessageScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.floatButton,
        onPressed: () {},
        child: SvgPicture.asset(AppImages.plusIcon),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: IndexedStack(
        index: selectedIndex,
        children: classes,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 70.h,
        color: Theme.of(context).primaryColorDark,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0.sp,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(AppImages.homeIcon, 0),
            buildNavItem(AppImages.message, 1),
            SizedBox(width: 48.w),
            buildNavItem(AppImages.notification, 2),
            buildNavItem(AppImages.profile, 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(String icon, int index) {
    return GestureDetector(
      onTap: () => onTabTapped(index),
      child: SvgPicture.asset(
        icon,
        color: selectedIndex == index ? AppColors.lightGray1 : Colors.white,
      ),
    );
  }
}
