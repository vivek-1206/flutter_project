import 'package:car_rental_vivek_2112/features/signinScreen/model/signin_request.dart';
import 'package:car_rental_vivek_2112/features/signinScreen/model/signin_response.dart';
import 'package:car_rental_vivek_2112/features/signinScreen/repository/signin_repository.dart';
import 'package:car_rental_vivek_2112/utils/local_storage_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  LoginRepository repository;
  LoginViewModel({required this.repository});

  Future<SignInResponseModel> loginApi(SignInRequestModel model) async {
    try {
      final response = await repository.login(model.toJson());
      SignInResponseModel modelData =
          SignInResponseModel.fromJson(response.data);
      saveTheUserData(modelData);
      return modelData;
    } catch (e) {
      return SignInResponseModel(error: true);
    }
  }

  saveTheUserData(SignInResponseModel responseModel) async {
    if (responseModel.error == false) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          LocalStorageConstants.userId, responseModel.student?.id ?? "");
      await prefs.setString(
          LocalStorageConstants.name, responseModel.student?.name ?? "");
      await prefs.setString(
          LocalStorageConstants.emmail, responseModel.student?.email ?? "");
    }
  }

  //Save the user information like -> id, name, token and email
}