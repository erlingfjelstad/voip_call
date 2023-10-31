import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voip_calling/app/call/call_bloc.dart';
import 'package:voip_calling/app/call/call_event.dart';

@RoutePage()
class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CallBloc()..add(InitEvent()),
      child: Builder(builder: _buildPage),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<CallBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Call Page',
        ),
      ),
      body: const Center(
        child: Text(
          'This is call page',
          style: TextStyle(color: Colors.green, fontSize: 16),
        ),
      ),
    );
  }
}
