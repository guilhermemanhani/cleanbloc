import 'package:blocclean/app/auth/domain/entities/logged_user.dart';
import 'package:blocclean/app/auth/domain/errors/errors.dart';
import 'package:blocclean/app/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ILoginUsecase {
  Future<Either<AuthException, LoggedUser>> call(CredentialParams params);
}

class LoginUsecase implements ILoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<AuthException, LoggedUser>> call(
      CredentialParams params) async {
    if (params.password.isEmpty) {
      return Left(AuthException("Senha vazia"));
    }
    if (params.password.length < 6) {
      return Left(AuthException("Senha curta"));
    }

    return await repository.login(params);
  }
}

class CredentialParams {
  final String email;
  final String password;

  CredentialParams({required this.email, required this.password});
}
