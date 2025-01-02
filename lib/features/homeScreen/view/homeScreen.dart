import 'package:car_rental_vivek_2112/features/cars/view/cars_list_view.dart';
import 'package:car_rental_vivek_2112/features/profileScreen/view/profileview.dart';
import 'package:car_rental_vivek_2112/utils/color_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> screens = const [
    CarsListScreen(),
    Profileview()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorConstants.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (value) => onTapAction(value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  onTapAction(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}