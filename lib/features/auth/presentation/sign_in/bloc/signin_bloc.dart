import 'dart:async';

import 'package:dandia/features/auth/presentation/sign_up/sign_up_view.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/services/dialog_and_sheet_service/i_dialog_and_sheet_service.dart';
import 'package:dandia/services/navigation_service/i_navigation_service.dart';
import 'package:dandia/services/network_service/i_network_service.dart';
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
    on<SigninWithEmailEvent>(_signIn);
  }

  final _navigation = locator<INavigationService>();
  final _network = locator<INetworkService>();
  final _dialogAndSheet = locator<IDialogAndSheetService>();

  FutureOr<void> _navigateToSignup(
      NavigateToSignupEvent event, Emitter<SigninState> emit) {
    _navigation.navigateToNamed(SignUpScreen.routeName);
  }

  FutureOr<void> _signIn(
      SigninWithEmailEvent event, Emitter<SigninState> emit) async {
    emit(SigninInitial());

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
