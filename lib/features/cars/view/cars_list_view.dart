
import 'package:car_rental_vivek_2112/features/cars/viewmodel/cars_view_model.dart';

import 'package:car_rental_vivek_2112/widgets/cars_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CarsListScreen extends StatefulWidget {
  const CarsListScreen({Key? key}) : super(key: key);

  @override
  _CarsListScreenState createState() => _CarsListScreenState();
}

class _CarsListScreenState extends State<CarsListScreen> {
  @override
  Widget build(BuildContext context) {
    final carsViewModel = Provider.of<CarsViewModel>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Cars List"),
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () {
            carsViewModel.getCars();
          }),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final carData = carsViewModel.cars[index];
            return CarsCardWidget(
              carData: carData
            );
          },
          itemCount: carsViewModel.cars.length,
        )
    );
  }

  @override
  void initState() {
    fetchCars();
    super.initState();
  }

  fetchCars() async {
    final carsViewModel = Provider.of<CarsViewModel>(context, listen: false);
    carsViewModel.getCars();
  }
}

