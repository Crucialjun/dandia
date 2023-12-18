import 'dart:async';

import 'package:dandia/features/auth/domain/params/add_new_user_to_db_params.dart';
import 'package:dandia/features/auth/domain/params/register_with_email_params.dart';
import 'package:dandia/features/auth/domain/usecases/add_new_user_to_db_usecase.dart';
import 'package:dandia/features/auth/domain/usecases/register_with_email_usecase.dart';
import 'package:dandia/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/services/dialog_and_sheet_service/i_dialog_and_sheet_service.dart';
import 'package:dandia/services/navigation_service/i_navigation_service.dart';
import 'package:dandia/services/network_service/i_network_service.dart';
import 'package:dandia/shared/dialogs/loading_dialog.dart';
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

  FutureOr<void> _signUp(
      SignupWithEmailEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    await _network.checkConnectivity().then((value) async {
      if (value) {
        _dialogAndSheet.showAppDialog(
            const LoadingDialog(message: "Registering your account...."));
        final res = await RegisterWithEmailUsecase().call(
            RegisterWithEmailParams(
                email: event.email, password: event.password));
        _navigation.back();

        res.fold((l) {
          _dialogAndSheet.showSnackBar(message: l.message);
        }, (r) async {
          await AddNewUserToDbUseCase().call(AddNewUserToDbParams(
              id: r?.uid ?? "",
              email: event.email,
              name: event.username,
              phone: event.phone,
              blockStatus: false));
        });
      } else {
        _dialogAndSheet.showSnackBar(
          message: "No Internet Connection",
        );
      }
    });
  }
}
