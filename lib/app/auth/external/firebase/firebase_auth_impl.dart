import 'package:blocclean/app/auth/domain/usecases/login_usecase.dart';
import 'package:blocclean/app/auth/domain/entities/logged_user.dart';
import 'package:blocclean/app/auth/external/firebase/mapper.dart';
import 'package:blocclean/app/auth/infra/datasources/auth_datasource.dart';

class FirebaseAuth implements AuthDatasource {
  @override
  Future<LoggedUser> login(CredentialParams params) async {
    final map = {'name': 'guilherme', 'email': 'guilherme@com.br'};
    return LoggeuserMapper.fromJson(map);
  }
}
