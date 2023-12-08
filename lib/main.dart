import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_project/bloc/bottom_navigation/bottom_nav_bloc.dart';
import 'package:my_practice_project/bloc/reservation/reservation_bloc.dart';
import 'package:my_practice_project/screens/base_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBloc(),
        ),
        BlocProvider(
          create: (context) => ReservationBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.lightBlueAccent),
            useMaterial3: true
        ),
        debugShowCheckedModeBanner: false,
        home: const BaseScreen(),
      ),
    );
  }
}

