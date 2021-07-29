import 'package:blocclean/app/auth/domain/entities/logged_user.dart';
import 'package:blocclean/app/auth/domain/usecases/login_usecase.dart';

abstract class AuthDatasource {
  Future<LoggedUser> login(CredentialParams params);
}
