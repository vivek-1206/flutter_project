
import 'package:car_rental_vivek_2112/features/addCar/view/addScreen.dart';

import 'package:car_rental_vivek_2112/features/cars/view/cars_list_view.dart';
import 'package:car_rental_vivek_2112/features/homeScreen/view/homeScreen.dart';
import 'package:car_rental_vivek_2112/features/profileScreen/view/profileview.dart';
import 'package:car_rental_vivek_2112/features/signinScreen/view/signinView.dart';
import 'package:car_rental_vivek_2112/features/signupScreen/view/signupView.dart';
import 'package:car_rental_vivek_2112/features/splashScreen/view/splashScreen.dart';
import 'package:car_rental_vivek_2112/routes/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class AppRouter {

static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

static final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RoutesConstants.loginScreen,
  routes: <RouteBase>[
    GoRoute(
      path: RoutesConstants.splashScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RoutesConstants.loginScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SigninView();
      },
    ),
    GoRoute(
      path: RoutesConstants.homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: RoutesConstants.signupScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SignupView();
      },
    ),
    GoRoute(
      path: RoutesConstants.profileScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const Profileview();
      },
    ),
    GoRoute(
      path: RoutesConstants.carScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const CarsListScreen();
      },
    ),
    GoRoute(
      path: RoutesConstants.addCarScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const AddScreen();
      },
    ),
  ],
   errorBuilder: (BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  }
);
}