
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
     
    });
    on<NavigateToSigninEvent>(_navigateToSignin);
  }

  FutureOr<void> _navigateToSignin(NavigateToSigninEvent event, Emitter<SignupState> emit) {
    
  }
}
