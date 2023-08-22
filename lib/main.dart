import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/bloc/user_bloc.dart';
import 'package:starter_app/repository/rest_client.dart';
import 'package:starter_app/ui/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final RestClient apiService =
        RestClient(Dio(BaseOptions(contentType: "application/json")));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc(apiService)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
