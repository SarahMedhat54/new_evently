import 'package:evently_c17/provider/theme_provider.dart';
import 'package:evently_c17/ui/screens/add_event/add_event_screen.dart';
import 'package:evently_c17/ui/screens/details/details_screen.dart';
import 'package:evently_c17/ui/screens/login/login_screen.dart';
import 'package:evently_c17/ui/screens/navigation/navigation_screen.dart';
import 'package:evently_c17/ui/screens/onboarding_screen/onboarding.dart';
import 'package:evently_c17/ui/screens/splash_screen/splash.dart';
import 'package:evently_c17/ui/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'l10n/app_localizations.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create : (_) => ThemeProvider(),
    child: MyApp(),
  )) ;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeProvider themeProvider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      routes: {
        // Onboarding.id:(context) => Onboarding(),
        // "Login" :(context) => LoginScreen(),
      },
      // initialRoute: Onboarding.id,
      debugShowCheckedModeBanner: false,
      //home:  Splash(),
      home:LoginScreen(),
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
