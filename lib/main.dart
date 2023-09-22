import 'package:flutter/material.dart';
import 'screens/my_home.dart';
import 'theme/my_new_theme.dart';
import 'package:flutter/services.dart';

import 'utils/bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Run the app.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // we need to use here and not in main app
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: myLightTheme.copyWith(useMaterial3: true),
      darkTheme: myDarkTheme.copyWith(useMaterial3: true),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const NavigationExample(),
    );
  }
}
