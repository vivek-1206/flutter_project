import 'package:car_rental_vivek_2112/features/splashScreen/viewModel/splashviewmodel.dart';
import 'package:car_rental_vivek_2112/routes/routes_constants.dart';
import 'package:car_rental_vivek_2112/services/navigation_services.dart';
import 'package:car_rental_vivek_2112/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: Center(
        child: LogoWidget(width: 100, height: 100),
      ),
    );
  }

  @override
  void initState() {
    checkUserSession();
    super.initState();
  }

  checkUserSession() async {
    await Future.delayed(const Duration(seconds: splashDuration));
    
    NavigationServices().replaceAll(RoutesConstants.loginScreen);
  }
}