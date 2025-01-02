


import 'package:car_rental_vivek_2112/routes/routes.dart';

class NavigationServices {
  static final NavigationServices _instance = NavigationServices._internal();
  NavigationServices._internal();
  factory NavigationServices() {
    return _instance;
  }

  Future<dynamic> navigateTo(String routeName) async {
    return AppRouter.router.push(routeName);
  }

  void goBack() {
    return AppRouter.router.pop();
  }

  void replaceWith(String routeName) {
    AppRouter.router.replace(routeName);
  }

  void replaceAll(String routeName){
     AppRouter.router.go(routeName);
  }
}