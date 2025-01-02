import 'package:car_rental_vivek_2112/features/signupScreen/repository/signup_repository.dart';
import 'package:car_rental_vivek_2112/services/api_services.dart';
import 'package:car_rental_vivek_2112/utils/server_constants.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  final ApiServices _apiServices = ApiServices();
  @override
  Future<dynamic> signUp(payload) {
    return _apiServices.postCall(ServerConstants.baseurl+ServerConstants.signup, payload);
  }
}