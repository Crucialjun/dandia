import 'dart:async';

import 'package:dandia/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:dandia/features/auth/presentation/sign_up/sign_up_view.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/services/navigation_service/i_navigation_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NavigateToSignupEvent>(_navigateToSignup);
  }

  final _navigation = locator<INavigationService>();

  FutureOr<void> _navigateToSignup(
      NavigateToSignupEvent event, Emitter<SigninState> emit) {
    _navigation.navigateToNamed(SignUpScreen.routeName);
  }
}
