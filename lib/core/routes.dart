import 'package:dandia/features/auth/sign_in_screen.dart';
import 'package:dandia/features/auth/sign_up_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case SignInView.routeName:
        return MaterialPageRoute(builder: (_) => const SignInView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
