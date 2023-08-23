import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/bloc/product/product_bloc.dart';
import 'package:starter_app/bloc/user/user_bloc.dart';
import 'package:starter_app/repository/escuelajs_api_service.dart';
import 'package:starter_app/repository/reqres_api_service.dart';
import 'package:starter_app/ui/pages/reqres_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ReqresApiService reqresApiService =
        ReqresApiService(Dio(BaseOptions(contentType: "application/json")));
    final EscuelajsApiService escuelajsApiService =
        EscuelajsApiService(Dio(BaseOptions(contentType: "application/json")));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc(reqresApiService)),
        BlocProvider(create: (context) => ProductBloc(escuelajsApiService)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ReqresPage(),
      ),
    );
  }
}
