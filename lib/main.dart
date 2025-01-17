import 'package:flutter/material.dart';
import 'package:fintableapp/v/drawer_controller.dart' as drawer;
import 'package:get/instance_manager.dart';

void main() {
  Get.put<drawer.DrawerController>(drawer.DrawerController());
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        home: const drawer.DrawerView(),
      ),
    );
  }
}
