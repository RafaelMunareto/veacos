import 'package:veacos/app/shared/auth/model/user_dio_client.model.dart';

abstract class IAuthRepository {
  Future loginDio(email, password);
  Future sendEmailChangePassword(String email);
  Future changeUserPassword(String id, String password);
  Future saveUser(UserClientModel model);
  Future perfilUser(UserClientModel user);
  Future getGoogleLogin();
  getUser();
  Future getFacebookLogin();
  getLogout();
}
