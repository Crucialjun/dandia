import 'dart:async';

import 'package:dandia/core/constants/hive_box_names.dart';
import 'package:dandia/core/constants/hive_storage_keys.dart';
import 'package:dandia/core/usecase.dart';
import 'package:dandia/features/auth/domain/params/sign_in_with_email_params.dart';
import 'package:dandia/features/auth/domain/usecases/retrieve_user_usecase.dart';
import 'package:dandia/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:dandia/features/auth/domain/usecases/sign_in_with_email_usecase.dart';
import 'package:dandia/features/auth/presentation/sign_up/sign_up_view.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/features/home/presentation/home_view.dart';
import 'package:dandia/services/dialog_and_sheet_service/i_dialog_and_sheet_service.dart';
import 'package:dandia/services/local_storage_service/i_local_storage_service.dart';
import 'package:dandia/services/navigation_service/i_navigation_service.dart';
import 'package:dandia/services/network_service/i_network_service.dart';
import 'package:dandia/shared/dialogs/loading_dialog.dart';
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
  final _localStorage = locator<ILocalStorageService>();

  FutureOr<void> _navigateToSignup(
      NavigateToSignupEvent event, Emitter<SigninState> emit) {
    _navigation.navigateToNamed(SignUpScreen.routeName);
  }

  FutureOr<void> _signIn(
      SigninWithEmailEvent event, Emitter<SigninState> emit) async {
    emit(SigninInitial());

    await _network.checkConnectivity().then((value) async {
      if (value) {
        _dialogAndSheet.showAppDialog(
            const LoadingDialog(message: "Signing in to  your account...."));
        var res = await SignInWithEmailUsecase().call(SignInWithEmailParams(
            email: event.email, password: event.password));

        res.fold((l) {
          _navigation.back();
          _dialogAndSheet.showSnackBar(message: l.message);
        }, (r) async {
          var doesExist = await RetrieveUserUsecase().call(r?.uid ?? "");
          doesExist.fold((l) {
            _navigation.back();
            _dialogAndSheet.showSnackBar(message: l.message);
          }, (r) async {
            if (r != null) {
              if (r.blockStatus) {
                await LogOutUsecase().call(NoParams());
                _dialogAndSheet.showSnackBar(
                    message: "You are blocked by admin");
                return;
              } else {
                await _localStorage.write(
                    boxName: HiveBoxNames.userBox,
                    key: HiveStorageKeys.userProfile,
                    value: r);
                _navigation.navigateToNamed(HomeView.routeName, arguments: r);
              }
            } else {
              await LogOutUsecase().call(NoParams());
              _navigation.back();
              _dialogAndSheet.showSnackBar(message: "User does not exist");
            }
          });
        });
      } else {
        _dialogAndSheet.showSnackBar(
          message: "No Internet Connection",
        );
      }
    });
  }
}
