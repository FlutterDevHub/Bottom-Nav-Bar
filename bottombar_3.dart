//_____________________Controller_____________________//
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs; 
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
// _____________________DashBoard Screen_____________________//
class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  final screens = [HomeScreen(), CareerScreen(), LeatherBoardScreen()];

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
//_____________________ Bottom Bar Class_____________________ //
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khelflex/controller/home_contrller/dashboard_controller.dart';
import 'package:khelflex/core/utils/constant/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final controller = Get.find<DashboardController>();

  final List<String> icons = [
    "assets/images/home.png",
    "assets/images/cup.png",
    "assets/images/stats.png",
  ];

  final List<String> labels = ["Home", "Career", "Callenges"];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = controller.selectedIndex.value == index;
            return GestureDetector(
              onTap: () => controller.changeTabIndex(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    icons[index],
                    height: 24,
                    color: isSelected ? AppColors.white : AppColors.grey2,
                  ),

                  Text(
                    labels[index],
                    style: TextStyle(
                      color: isSelected ? AppColors.white : AppColors.grey2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

//_____________________With Statful Widget_____________________//

// import 'package:e_commerce_app/core/Custom%20Widgets/custom_text.dart';
// import 'package:e_commerce_app/core/utils/Themes/app_color.dart';
// import 'package:e_commerce_app/core/utils/app_images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int selectedIndex = 0;

//   final List<Widget> pages = [
//     Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Search Page', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Saved Page', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Cart Page', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Account Page', style: TextStyle(fontSize: 24))),
//   ];

//   void onTabTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: pages[selectedIndex],
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Divider(height: 1, thickness: 1, color: AppColors.gray1),
//           Container(
//             color: AppColors.backgroundColor,
//             height: 9.h,
//             padding: EdgeInsets.symmetric(horizontal: 4.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 buildNavItem(AppImages.home, 'Home', 0),
//                 buildNavItem(AppImages.search, 'Search', 1),
//                 buildNavItem(AppImages.heart, 'Saved', 2),
//                 buildNavItem(AppImages.cart, 'Cart', 3),
//                 buildNavItem(AppImages.account, 'Account', 4),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildNavItem(String icon, String title, int index) {
//     final bool isSelected = selectedIndex == index;
//     final Color iconColor = isSelected ? Colors.black : AppColors.gray1;

//     return GestureDetector(
//       onTap: () => onTabTapped(index),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 2.w),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(icon, color: iconColor, height: 24, width: 24),
//             CustomText(
//               text: title,
//               color: iconColor,
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
