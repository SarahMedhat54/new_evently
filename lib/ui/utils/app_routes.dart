import 'package:evently_c17/ui/screens/navigation/navigation_screen.dart';
import 'package:evently_c17/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../screens/register/register_screen.dart';

abstract final class AppRoutes {
  // static MaterialPageRoute registerScreen = MaterialPageRoute(
  //   builder: (_) => RegisterScreen(),
  // );
  static MaterialPageRoute get login {
    return MaterialPageRoute(builder: (_) => LoginScreen());
  }

  static MaterialPageRoute get register {
    return MaterialPageRoute(builder: (_) => RegisterScreen());
  }

  static MaterialPageRoute get navigation {
    return MaterialPageRoute(builder: (_) => NavigationScreen());
  }
}
