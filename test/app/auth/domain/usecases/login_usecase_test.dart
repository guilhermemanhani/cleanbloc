import 'package:blocclean/app/auth/domain/entities/logged_user.dart';
import 'package:blocclean/app/auth/domain/errors/errors.dart';
import 'package:blocclean/app/auth/domain/repositories/auth_repository.dart';
import 'package:blocclean/app/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {
  // @override
  // Future<Either<AuthException, LoggedUser>> login(
  //     CredentialParams params) async {
  //   if (params.password == "abc123") {
  //     return Left(AuthException("repository erro"));
  //   }
  //   return Right(LoggedUser(
  //     email: params.email,
  //     name: "Guilherme",
  //   ));
  // }
}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = LoginUsecase(repository);
  final params = CredentialParams(
    email: "guilherme@com.br",
    password: "123456",
  );

  test("Deve efetuar login", () async {
    when(() => repository.login(params)).thenAnswer(
      (_) async => Right(
        LoggedUser(
          name: "Guilherme",
          email: params.email,
        ),
      ),
    );
    final result = await usecase(params);
    expect(result.isRight(), true);
    expect(
        result
            .getOrElse(() => LoggedUser(
                  email: "",
                  name: "",
                ))
            .name,
        "Guilherme");
  });

  // test("Deve efetuar login", () async {
  //   final result = await usecase(
  //     CredentialParams(
  //       email: "guilherme@com.br",
  //       password: "123456",
  //     ),
  //   );
  //   expect(result.isRight(), true);
  //   expect(
  //       result
  //           .getOrElse(() => LoggedUser(
  //                 email: "",
  //                 name: "",
  //               ))
  //           .name,
  //       "Guilherme");
  // });

  test("Deve dar erro senha vazia", () async {
    final result = await usecase(
      CredentialParams(
        email: "guilherme@com.br",
        password: "",
      ),
    );
    expect(result.isLeft(), true);
  });

  test("Deve dar erro senha curta", () async {
    final result = await usecase(
      CredentialParams(
        email: "guilherme@com.br",
        password: "1234",
      ),
    );
    // final leftValue = result.fold(id, id) as AuthException;
    expect(result.isLeft(), true);
  });

  test("Deve dar falha no repositorio", () async {
    when(() => repository.login(params))
        .thenAnswer((_) async => Left(AuthException("d")));
    final result = await usecase(params);
    expect(result.isLeft(), true);
  });

  // test("Deve dar erro no repository", () async {
  //   final result = await usecase(
  //     CredentialParams(
  //       email: "guilherme@com.br",
  //       password: "abc123",
  //     ),
  //   );
  //   expect(result.isLeft(), true);
  // });
}
