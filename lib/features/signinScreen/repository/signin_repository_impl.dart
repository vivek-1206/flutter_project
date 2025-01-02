import 'package:car_rental_vivek_2112/features/signinScreen/repository/signin_repository.dart';
import 'package:car_rental_vivek_2112/services/api_services.dart';
import 'package:car_rental_vivek_2112/utils/server_constants.dart';

class LoginRepositoryImpl  extends LoginRepository{
  final _apiServices = ApiServices();
  @override
  Future<dynamic> login(payload) {
    return _apiServices.postCall(ServerConstants.baseurl+ServerConstants.signIn, payload);
  }
  

}