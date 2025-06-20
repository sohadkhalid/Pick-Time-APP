import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picktime/core/app_style.dart';
import 'package:picktime/cubit/auth_cubit.dart';
import 'package:picktime/screens/login_screen.dart';
import 'package:picktime/screens/splash_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => AuthCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PickTime App',
      theme: AppStyle.themeData,
      home: const SplashScreen(),
    );
  }
}
