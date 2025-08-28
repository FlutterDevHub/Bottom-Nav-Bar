import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarPages extends StatelessWidget {
  BottomBarPages({Key? key}) : super(key: key);

  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.pages[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Colors.black),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

// ✅ GetX Controller
class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<Widget> pages = const [
    Center(child: Text('Home Page')),
    Center(child: Text('Saved Page')),
    Center(child: Text('Downloads Page')),
    Center(child: Text('Profile Page')),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
