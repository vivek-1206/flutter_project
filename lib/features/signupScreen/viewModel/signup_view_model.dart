import 'package:car_rental_vivek_2112/features/signupScreen/model/signup_request.dart';
import 'package:car_rental_vivek_2112/features/signupScreen/model/signup_response.dart';
import 'package:car_rental_vivek_2112/features/signupScreen/repository/signup_repository.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpRepository repository;
  SignUpViewModel({required this.repository});

  Future<SignUpResponseModel> signUpTheUser(SignUpRequestModel model) async {
    try {
      final response = await repository.signUp(model.toJson());
      SignUpResponseModel signUpResponseModel =
          SignUpResponseModel.fromJson(response.data);
      return signUpResponseModel;
    } catch (e) {
      return SignUpResponseModel(error: true,message: "Something went Wrong!!");
    }
  }
}