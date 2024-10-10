import 'package:application_music/bloc/auth_bloc/auth_bloc.dart';
import 'package:application_music/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    const MainActivity(),
  );
}

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
