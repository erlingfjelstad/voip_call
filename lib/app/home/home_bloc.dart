import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:voip_calling/app/home/home_event.dart';
import 'package:voip_calling/app/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<InitEvent>(_initEvent);
  }

  FutureOr<void> _initEvent(
    InitEvent event,
    Emitter<HomeState> emit,
  ) {
    // emit something
  }
}
