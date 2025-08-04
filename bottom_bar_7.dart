import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phesky/controller/dashboard%20controller/dashboard_ctrl.dart';
import 'package:phesky/core/common/custam_container.dart';
import 'package:phesky/core/common/custom_svg.dart';
import 'package:phesky/core/extensions/size_box_extension.dart';
import 'package:phesky/core/utils/constant/app_colors.dart';
import 'package:phesky/core/utils/constant/app_images.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final controller = Get.find<DashboardCtrl>();

  final List<String> icons = [
    AppImages.home,
    AppImages.contect,
    AppImages.wallet,
    AppImages.setting,
  ];

  final List<String> labels = ["Home", "Contacts", "Wallet", "Settings"];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomContainer(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = controller.selectedIndex.value == index;
            return GestureDetector(
              onTap: () => controller.changeTabIndex(index),
              child: Row(
                children: [
                  isSelected
                      ? ShaderMask(
                        shaderCallback:
                            (bounds) => const LinearGradient(
                              colors: [Color(0xFF3E3C61), Color(0xFF7970BD)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds),
                        blendMode: BlendMode.srcIn,
                        child: CustomSvgImage(image: icons[index]),
                      )
                      : CustomSvgImage(
                        image: icons[index],
                        color: AppColors.black,
                      ),

                  6.widthBox,
                  if (isSelected)
                    ShaderMask(
                      shaderCallback:
                          (bounds) => const LinearGradient(
                            colors: [Color(0xFF3E3C61), Color(0xFF7970BD)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds),
                      blendMode: BlendMode.srcIn,
                      child: Text(
                        labels[index],
                        style: TextStyle(
                          color: AppColors.primaryColor2,
                          fontWeight: FontWeight.w600,
                        ),
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
