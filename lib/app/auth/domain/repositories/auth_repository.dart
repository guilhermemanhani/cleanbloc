import 'package:blocclean/app/auth/domain/entities/logged_user.dart';
import 'package:blocclean/app/auth/domain/errors/errors.dart';
import 'package:blocclean/app/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<AuthException, LoggedUser>> login(CredentialParams params);
}
