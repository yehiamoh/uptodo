import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/cubits/cubit/add_task_cubit.dart';
import 'package:up_todo/cubits/cubit/cubit/fetch_tasks_cubit.dart';
import 'package:up_todo/firebase_options.dart';
import 'package:up_todo/screens/bottom_nav_bar.dart';
import 'package:up_todo/screens/login_screen.dart';
import 'package:up_todo/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddTaskCubit(),
        ),
        BlocProvider(
          create: (context) => FetchTasksCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return LoginScreen();
              }
              if (snapshot.hasData) {
                return BottomNavBar();
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return SnackBar(content: Text("error in loging in "));
              }
              return Text('data');
            }),
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
