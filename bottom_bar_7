
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_chat/controller/home_ctrl/dashboard_ctrl.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final controller = Get.put(DashboardController());

  final List<IconData> icons = [
    Icons.person_outline,
    Icons.brush_outlined,
    Icons.mail_outline,
    Icons.chat_bubble_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => controller.changeTabIndex(2),
        shape: const CircleBorder(),
        child: const Icon(Icons.favorite, color: Colors.white, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Custom Bottom Bar
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          shape: CustomNotchedShape(),
          notchMargin: 6,
          color: Colors.deepOrange,
          elevation: 8,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(icons.length, (index) {
                if (index == 2) return const SizedBox(width: 60);

                final isSelected = controller.selectedIndex.value == index;
                return GestureDetector(
                  onTap: () => controller.changeTabIndex(index),
                  child: Icon(
                    icons[index],
                    size: 28,
                    color: isSelected ? Colors.green : Colors.grey,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNotchedShape extends NotchedShape {
  final double notchRadius;
  final double topOffset;

  CustomNotchedShape({this.notchRadius = 10.0, this.topOffset = 5.0});

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final double notchRadiusLocal = notchRadius;
    final double topOffsetLocal = topOffset;

    if (guest == null || !guest.overlaps(host)) {
      // no notch
      return Path()
        ..addRRect(RRect.fromRectAndCorners(host,
            topLeft: Radius.circular(0), topRight: Radius.circular(0)));
    }

    final double notchCenterX = guest.center.dx;
    final double notchWidth = guest.width / 2 + 4; // adjust width if needed
    final double notchHeight = guest.height / 2 + 4; // adjust height if needed

    Path path = Path();
    path.moveTo(
        host.left, host.top + topOffsetLocal); // move top line a bit down
    path.lineTo(notchCenterX - notchWidth, host.top + topOffsetLocal);
    path.arcToPoint(
      Offset(notchCenterX + notchWidth, host.top + topOffsetLocal),
      radius: Radius.circular(notchRadiusLocal),
      clockwise: false,
    );
    path.lineTo(host.right, host.top + topOffsetLocal);
    path.lineTo(host.right, host.bottom);
    path.lineTo(host.left, host.bottom);
    path.close();

    return path;
  }
}
