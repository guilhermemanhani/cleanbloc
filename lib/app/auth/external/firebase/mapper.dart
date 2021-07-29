import 'package:blocclean/app/auth/domain/entities/logged_user.dart';

class LoggeuserMapper {
  static LoggedUser fromJson(Map json) {
    return LoggedUser(name: json["name"], email: json["email"]);
  }
}

// class  LoggedUserInternal extends LoggedUser {
//   LoggedUserInternal() : super(); aqui da para colocar o to json e from json
// }
