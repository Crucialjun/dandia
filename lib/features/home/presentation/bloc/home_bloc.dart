import 'dart:async';

import 'package:dandia/core/locator.dart';
import 'package:dandia/core/usecase.dart';
import 'package:dandia/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:dandia/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:dandia/services/local_storage_service/i_local_storage_service.dart';
import 'package:dandia/services/location_service/i_location_service.dart';
import 'package:dandia/services/navigation_service/i_navigation_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeInitEvent>(_homeInit);
    on<LogoutEvent>(_logout);
  }
  final _locationService = locator<ILocationService>();
  final _localStorage = locator<ILocalStorageService>();
  final _navigation = locator<INavigationService>();

  FutureOr<void> _homeInit(HomeInitEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    var res = await _locationService.getCurrentLocation();
    emit(HomeLoaded(res));
  }

  FutureOr<void> _logout(LogoutEvent event, Emitter<HomeState> emit) async {
    await LogOutUsecase().call(NoParams());
    await _localStorage.deleteAll();
    _navigation.navigateToNamed(SignInView.routeName);
  }
}
