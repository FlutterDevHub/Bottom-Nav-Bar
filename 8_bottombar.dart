// _____________📱🖊️ Controller_________________//
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs; 
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
//_____________ 🆑📊Class__________________//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_chat/controller/home_ctrl/dashboard_ctrl.dart';
import 'package:run_chat/core/custom%20widgets/custom_svg.dart';
import 'package:run_chat/core/utils/constant/app_color.dart';
import 'package:run_chat/core/utils/constant/app_images.dart';
import 'package:run_chat/views/home%20view/chat/chat_screen.dart';
import 'package:run_chat/views/home%20view/chat/random_chat.dart';
import 'package:run_chat/views/home%20view/home/home_screen.dart';
import 'package:run_chat/views/home%20view/explore/explore_recomemded.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final controller = Get.put(DashboardController());
  final screens = [
    () => HomeScreen(),
    () => ExploreRecomemded(),
    () => const RandomChat(),
    () => ChatScreen(),
    () => HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final currentScreen = screens[controller.selectedIndex.value];
        return currentScreen();
      }),
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 20),
        child: FloatingActionButton(
          heroTag: "",
          backgroundColor: AppColors.primaryColor,
          onPressed: () => controller.changeTabIndex(2),
          shape: const CircleBorder(),
          child: const Icon(Icons.favorite, color: AppColors.white, size: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Stack(
        children: [
          BottomAppBar(
            shape: const CustomNotchedShape(),
            notchMargin: 10,
            color: AppColors.white,
            elevation: 8,
            child: SizedBox(
              height: 60,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildNavItem(AppImages.profile, 0),
                    buildNavItem(AppImages.explore, 1),
                    const SizedBox(width: 10),
                    buildNavItem(AppImages.chat, 3),
                    buildNavItem(AppImages.message, 4),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: NotchedBorderPainter(
                  host: Rect.fromLTWH(
                    0,
                    0,
                    MediaQuery.of(context).size.width,
                    80,
                  ),
                  guest: Rect.fromCenter(
                    center: Offset(MediaQuery.of(context).size.width / 2, 0),
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(String icon, int index) {
    final isSelected = controller.selectedIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changeTabIndex(index),
      child: CustomSvgImage(
        image: icon,
        height: 26,
        width: 26,
        color: isSelected ? AppColors.primaryColor : const Color(0xFF8E8895),
      ),
    );
  }
}

class CustomNotchedShape extends NotchedShape {
  const CustomNotchedShape();

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !guest.overlaps(host)) {
      return Path()..addRect(host);
    }

    final notchRadius = guest.width / 2.0 + 10;
    const s2 = 1.0;
    final r = notchRadius;
    final a = -1.0 * r - s2;
    final notchCenter = guest.center;

    Path path = Path()..moveTo(host.left, host.top);

    path.lineTo(notchCenter.dx + a, host.top);
    path.quadraticBezierTo(
      notchCenter.dx,
      host.top - r / 1.5,
      notchCenter.dx - a,
      host.top,
    );

    path.lineTo(host.right, host.top);
    path.lineTo(host.right, host.bottom);
    path.lineTo(host.left, host.bottom);
    path.close();

    return path;
  }
}

class NotchedBorderPainter extends CustomPainter {
  final Rect host;
  final Rect? guest;

  NotchedBorderPainter({required this.host, this.guest});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.dividerColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(host.left, host.top);

    if (guest == null || !guest!.overlaps(host)) {
      path.lineTo(host.right, host.top);
    } else {
      final notchRadius = guest!.width / 2.0 + 10;
      const s2 = 1.0;
      final r = notchRadius;
      final a = -1.0 * r - s2;
      final notchCenter = guest!.center;

      path.lineTo(notchCenter.dx + a, host.top);
      path.quadraticBezierTo(
        notchCenter.dx,
        host.top - r / 1.5,
        notchCenter.dx - a,
        host.top,
      );

      path.lineTo(host.right, host.top);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
