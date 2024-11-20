import 'package:budget_pal/core/networking/firebase_helper.dart';
import 'package:budget_pal/core/routing/routes.dart';
import 'package:budget_pal/core/widgets/no_route_screen.dart';
import 'package:budget_pal/features/home/home_screen.dart';
import 'package:budget_pal/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/ui/screens/login_screen.dart';

class Routing {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(FirebaseHelper()),
                  child: const LoginScreen(),
                ));
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(FirebaseHelper()),
                  child: const HomeScreen(),
                ));

      default:
        return MaterialPageRoute(builder: (_) => const NoRouteScreen());
    }
  }
}
