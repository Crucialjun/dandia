import 'dart:async';

import 'package:dandia/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/services/dialog_and_sheet_service/i_dialog_and_sheet_service.dart';
import 'package:dandia/services/navigation_service/i_navigation_service.dart';
import 'package:dandia/services/network_service/i_network_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {});
    on<NavigateToSigninEvent>(_navigateToSignin);
    on<SignupWithEmailEvent>(_signUp);
  }

  final _navigation = locator<INavigationService>();
  final _network = locator<INetworkService>();
  final _dialogAndSheet = locator<IDialogAndSheetService>();

  FutureOr<void> _navigateToSignin(
      NavigateToSigninEvent event, Emitter<SignupState> emit) {
    _navigation.navigateToNamed(SignInView.routeName);
  }

  FutureOr<void> _signUp(SignupEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    await _network.checkConnectivity().then((value) {
      if (value) {
      } else {
        _dialogAndSheet.showSnackBar(
          message: "No Internet Connection",
        );
      }
    });
  }
}
