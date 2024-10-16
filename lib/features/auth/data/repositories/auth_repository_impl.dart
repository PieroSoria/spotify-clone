import 'package:flutter/material.dart';
import 'package:my_app/core/api/api_client.dart';
import 'package:my_app/core/helper/app_constants.dart';
import 'package:my_app/features/auth/data/models/user_model.dart';
import 'package:my_app/features/auth/domain/entities/user_entity.dart';
import 'package:my_app/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:my_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences preferences;
  AuthRepositoryImpl({required this.apiClient, required this.preferences});

  @override
  Future<void> authLoginEmailWithPassword({
    required UserModel userModel,
  }) async {
    try {
      final response = await apiClient.postData(
        AppConstants.login,
        data: userModel.toJson(),
      );
      switch (response.statusCode) {
        case 200:
          await preferences.setString(
            AppConstants.token,
            response.data['access_token'],
          );
      }
    } catch (e) {
      debugPrint("El error de login es $e");
    }
  }

  @override
  Future<void> authRegisterEmailWithPassword({
    required UserModel userModel,
  }) async {
    try {
      final response = await apiClient.postData(
        AppConstants.register,
        data: userModel.toJson(),
      );
      switch (response.statusCode) {
        case 200:
          await preferences.setString(
            AppConstants.token,
            response.data['access_token'],
          );
          await preferences.setString(
            AppConstants.authStatus,
            AuthStatus.authenticated.name,
          );
      }
    } catch (e) {
      debugPrint("El error de login es $e");
    }
  }

  @override
  Future<String?> getVerifyAuthStatus() async {
    return preferences.getString(AppConstants.authStatus);
  }
}
