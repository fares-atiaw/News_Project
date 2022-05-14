import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_app/Screens/home.dart';

import 'my_theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "World News",
      routes: {
        HomeScreen.routeName: (context) => HomeScreen()
        //F_CategoryDetails.routeName : (context)=>F_CategoryDetails()
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}

// Error lib/Components/tab_controller_item.dart : Why here expanded ???
