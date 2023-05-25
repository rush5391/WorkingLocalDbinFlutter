import 'login_ctr.dart';
import 'model/users.dart';

class LoginRequest {
  LoginCtr con = new LoginCtr();
  Future<User?> getLogin(String username, String password) {
    var result = con.getLogin(username,password);
    return result;
  }
}