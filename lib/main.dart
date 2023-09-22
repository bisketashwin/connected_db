// main.dart

import 'package:flutter/material.dart';
import 'app_screens.dart';
// import 'screens/home_sreen.dart';
import 'theme/my_new_theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Add the `const` keyword to the constructor invocation.
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: myLightTheme.copyWith(useMaterial3: true),
      darkTheme: myDarkTheme.copyWith(useMaterial3: true),
      initialRoute: AppScreens.INITIAL,
      getPages: AppScreens.routes,
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}
