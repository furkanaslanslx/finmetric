import 'package:fintableapp/v/custom_drawer.dart';
import 'package:fintableapp/v/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

final ZoomDrawerController drawerController = ZoomDrawerController();

class DrawerView extends GetView<DrawerController> {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrawerController>(
      builder: (controller) {
        return ZoomDrawer(
          androidCloseOnBackTap: true,
          controller: drawerController,
          style: DrawerStyle.defaultStyle,
          menuScreen: const CustomDrawer(),
          mainScreen: const Navigation(),
          borderRadius: 24.0,
          showShadow: false,
          shadowLayer1Color: Colors.grey[700],
          shadowLayer2Color: Colors.grey[800],
          angle: 0.0,
          slideWidth: MediaQuery.of(context).size.width * 0.9,
          menuBackgroundColor: Colors.grey[900]!,
          duration: const Duration(milliseconds: 350),
          mainScreenScale: 0.2,
        );
      },
    );
  }
}

class DrawerController extends GetxController {
  void toggleDrawer() {
    debugPrint("Toggle drawer");
    drawerController.toggle?.call();
    update();
  }
}
