import 'package:evently_c17/ui/screens/login/login_screen.dart';
import 'package:evently_c17/ui/screens/navigation/navigation_screen.dart';
import 'package:evently_c17/ui/screens/onboarding_screen/onboarding.dart';
import 'package:evently_c17/ui/screens/splash_screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart';
import 'l10n/app_localizations.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   Onboarding.id:(context) => Onboarding(),
      //   "Login" :(context) => LoginScreen(),
      // },
      // initialRoute: Onboarding.id,
      debugShowCheckedModeBanner: false,
      home:  Splash(),
     // home: NavigationScreen(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: Locale('en'),
    );
  }
}
