import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voip_calling/app/home/home_bloc.dart';
import 'package:voip_calling/app/home/home_event.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc()..add(InitEvent()),
      child: Builder(builder: _buildPage),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: const Center(
        child: Text(
          'This is home page',
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
      ),
    );
  }
}
