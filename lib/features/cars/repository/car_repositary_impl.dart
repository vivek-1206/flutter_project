import 'package:car_rental_vivek_2112/features/cars/repository/car_repository.dart';
import 'package:car_rental_vivek_2112/services/api_services.dart';
import 'package:car_rental_vivek_2112/utils/server_constants.dart';

class CarRepositoryImpl extends CarRepository {
  final ApiServices _apiServices = ApiServices();
  @override
  Future<dynamic> getCarsList() {
    return _apiServices.getCall(ServerConstants.baseurl+ServerConstants.getAllCars);
  }
  
  @override
  Future addCar(data) {
    // TODO: implement addCar
    throw UnimplementedError();
  }
}