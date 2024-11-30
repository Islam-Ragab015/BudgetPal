import 'package:budget_pal/core/networking/firebase_helper.dart';
import 'package:budget_pal/core/routing/routing.dart';
import 'package:budget_pal/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:budget_pal/my_app.dart';
import 'package:budget_pal/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginCubit(FirebaseHelper()),
        ),
      ],
      child: MyApp(routing: Routing()),
    ),
  );
}
