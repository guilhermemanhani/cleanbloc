import 'package:blocclean/app/auth/domain/errors/errors.dart';
import 'package:blocclean/app/auth/domain/entities/logged_user.dart';
import 'package:blocclean/app/auth/domain/repositories/auth_repository.dart';
import 'package:blocclean/app/auth/infra/datasources/auth_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:blocclean/app/auth/domain/usecases/login_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialParams params) async {
    try {
      final user = await datasource.login(params);
      return Right(user);
    } on AuthException catch (e) {
      return Left(e);
    } on Exception {
      return Left(AuthException("Exception error"));
    }
  }
}
