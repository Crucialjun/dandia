import 'package:dandia/features/auth/presentation/sign_in_screen.dart';
import 'package:dandia/features/auth/presentation/sign_up/bloc/signup_bloc.dart';
import 'package:dandia/features/auth/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignUpScreen.routeName:
        return _registerBlocView(
            view: const SignInView(), bloc: SignupBloc(), settings: settings);
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

  static MaterialPageRoute _registerBlocView<T extends Bloc>({
    required Widget view,
    required T bloc,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => BlocProvider<T>(
        create: (context) => bloc,
        child: view,
      ),
    );
  }
}
