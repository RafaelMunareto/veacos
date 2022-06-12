// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:veacos/app/shared/auth/model/user_dio_client.model.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_share.dart';
import 'package:veacos/app/shared/utils/dio_struture.dart';
import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final ILocalStorage storage = LocalStorageShare();

  @override
  Future getFacebookLogin() {
    throw UnimplementedError();
  }

  @override
  Future getGoogleLogin() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    UserClientModel user = UserClientModel(
      name: googleUser.displayName,
      email: googleUser.email,
      password: '',
    );

    Response response;
    var dio = Dio(
      BaseOptions(
        baseUrl: DioStruture().baseUrlMunatasks,
      ),
    );

    response = await dio.get('usuarios/email/${googleUser.email}');
    DioStruture().statusRequest(response);
    if (response.data != null) {
      UserClientModel? userGet = UserClientModel.fromJson(response.data);
      return userGet;
    } else {
      saveUser(user).then((e) async {
        if (e.data != null) {
          UserClientModel userGet = UserClientModel.fromJson(e.data);
          perfilUser(userGet);
          return userGet;
        }
      });
    }
  }

  @override
  getLogout() async {
    await SessionManager().remove('token');
    await storage.put('token', []);
    await storage.put('user', []);
    await storage.put('login-normal', []);
    Modular.to.navigate('/auth/');
  }

  @override
  Future loginDio(email, password) async {
    email = email.toLowerCase();
    Response response;
    var dio = Dio(
      BaseOptions(
        baseUrl: DioStruture().baseUrlMunatasks,
      ),
    );

    response = await dio.post('users/signin',
        data: jsonEncode({"email": email, "password": password}));
    DioStruture().statusRequest(response);

    return response;
  }

  @override
  Future sendEmailChangePassword(email) async {
    email = email.toLowerCase();
    Response response;
    var dio = Dio(
      BaseOptions(
        baseUrl: DioStruture().baseUrlMunatasks,
      ),
    );

    response = await dio.get(
      '/usuarios/mail/change_password/$email',
    );
    DioStruture().statusRequest(response);
    return response;
  }

  @override
  getUser() async {
    return await storage.get('user').then((value) {
      if (value != null) {
        return UserClientModel.fromJson(jsonDecode(value[0]));
      }
    });
  }

  @override
  saveUser(UserClientModel model) async {
    model.email = model.email.toLowerCase();
    Response response;
    var dio = Dio(
      BaseOptions(
        baseUrl: DioStruture().baseUrlMunatasks,
      ),
    );

    response = await dio.post('/users/signup', data: model.toJson());
    DioStruture().statusRequest(response);
    return response;
  }

  @override
  Future changeUserPassword(String id, String password) async {
    Response response;
    var dio = Dio(
      BaseOptions(
        baseUrl: DioStruture().baseUrlMunatasks,
      ),
    );

    response = await dio
        .put('/usuarios/change_password/$id', data: {"password": password});
    DioStruture().statusRequest(response);
    return response;
  }

  @override
  Future perfilUser(UserClientModel user) {
    throw UnimplementedError();
  }
}
