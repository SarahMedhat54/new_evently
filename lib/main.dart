import 'package:evently_c17/ui/providers/language_provider.dart';
import 'package:evently_c17/ui/providers/theme_provider.dart';
import 'package:evently_c17/ui/screens/login/login_screen.dart';
import 'package:evently_c17/ui/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCmkHtjK29IRqt7K6iVDVSomHR7V0h7_BE",
      appId: "1:956929519141:android:23ab1bdb3b0a4bd386d9cc",
      messagingSenderId: "",
      projectId: "evently-offline-c17",
    ),
  );

  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: ChangeNotifierProvider(
        create: (_) => LanguageProvider(),
        child: const MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LanguageProvider provider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    themeProvider = Provider.of(context);
    /// Inherited widget
    print("_MyAppState provider.current = ${provider.currentLocale}");
    return MaterialApp(
      home: LoginScreen(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: Locale(provider.currentLocale),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,



      themeMode: themeProvider.themeMode,
    );
  }

  rebuild() {
    setState(() {});
  }
}
