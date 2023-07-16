import 'package:flutter/material.dart';
import 'Login_screen.dart';
import 'package:flutter/services.dart';
import 'dart:io'
    show
        Platform; //Information about the environment in which the current program is running.
import 'package:flutter/foundation.dart' show kIsWeb; // running on the web!
import 'package:screen_loader/screen_loader.dart';
// importing firebase libraries
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Prevent device orientation changes and force portrait up and down
main() async {
  //Setting the Global loading screen using the "screen_loader" library
  configScreenLoader(
    loader: AlertDialog(
      title: Text('Fetching data...'),
    ),
    bgBlur: 20.0, //Background blur
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() {
    print("completedAppInitialize");
  });
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
    //runs the app
  ]).then((_) => runApp(MyApp()));
}

// implements the app
// extend here allows App to inherit properties and methods from StatelessWidget
//change the status bar colour to transparent
class MyApp extends StatelessWidget {
  // @override helps to identify inherited methods or variables
  // that are being replaced in the subclass
  @override
  // builds the widget
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'PlantWatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS,
      ),
      routes: {
        "/": (context) => const loginPage(title: "Log in"), // login page
      },
    );
  }
}
