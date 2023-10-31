import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:voip_calling/app/call/call_event.dart';
import 'package:voip_calling/app/call/call_state.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  CallBloc() : super(CallState()) {
    on<InitEvent>(_initEvent);
  }

  FutureOr<void> _initEvent(
    InitEvent event,
    Emitter<CallState> emit,
  ) {
    // emit something
  }
}
