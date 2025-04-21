import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:
              (index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home_filled), label: "home"),
            NavigationDestination(icon: Icon(Icons.shop_2), label: "Store"),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: "Whitelist",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_3_rounded),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
// Controler Class
class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    Center(child: Text("Home")),
    Center(child: Text("Store")),
    Center(child: Text("Whitelist")),
    Center(child: Text("Profile")),
  ];
}
