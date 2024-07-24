import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_concurrent_api_call/ApiCallScreenSerial.dart';

import 'ApiCallScreen.dart';
import 'bloc/call_screen_bloc.dart';
import 'bloc/call_screen_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CallScreenBloc>(create: (context) => CallScreenBloc(CallScreenInitial()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  ApiCallScreenSerial(),
      ),
    );
  }
}

