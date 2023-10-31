import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voip_calling/app/call/call_bloc.dart';
import 'package:voip_calling/app/call/call_event.dart';
import 'package:voip_calling/app/call/call_state.dart';

class CallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CallBloc()..add(InitEvent()),
      child: Builder(builder: _buildPage),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<CallBloc>(context);

    return Container();
  }
}

