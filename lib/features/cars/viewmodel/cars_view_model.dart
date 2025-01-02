import 'package:car_rental_vivek_2112/features/cars/model/carsModel.dart';
import 'package:car_rental_vivek_2112/features/cars/repository/car_repository.dart';
import 'package:car_rental_vivek_2112/widgets/loader_widget.dart';
import 'package:flutter/material.dart';

class CarsViewModel extends ChangeNotifier {
  List<Cars> cars = [];
  CarRepository repository;
  CarsViewModel({required this.repository});

  //Api Serice
  //Repos -> abstract -> imple

  Future<void> getCars() async {
    try {
      LoaderWidget.showLoader();
      final response = await repository.getCarsList();
      LoaderWidget.hideLoader();
      if (response.statusCode == 200) {
        final carsModel = CarsModelData.fromJson(response.data);
        cars = carsModel.cars ?? [];
      }
    } catch (e) {
      LoaderWidget.hideLoader();
      cars = [];
    } finally {
      notifyListeners();
    }

  }
}
