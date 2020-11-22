import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/login_cubit/login_cubit.dart';
import 'form.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // we create our cubit as material parent in this case,
    // but you can created in the widget tree you need it.
    return BlocProvider<LoginCubit>(
      create: (_) => LoginCubit(),
      child: MaterialApp(
        title: 'Forms with Flutter Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FormPage(),
      ),
    );
  }
}
