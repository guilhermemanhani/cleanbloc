// import 'package:blocclean/app/auth/domain/usecases/login_usecase.dart';
// import 'package:flutter/material.dart';

import 'package:blocclean/app/auth/domain/usecases/login_usecase.dart';
import 'package:blocclean/app/auth/external/firebase/firebase_auth_impl.dart';
import 'package:blocclean/app/auth/infra/repositories/auth_repository_impl.dart';
import 'package:kiwi/kiwi.dart';

final container = KiwiContainer()
  ..registerFactory((container) => LoginUsecase(container.resolve()))
  ..registerFactory((container) => AuthRepositoryImpl(container.resolve()))
  ..registerFactory((container) => FirebaseAuth);
void main() {
  final usecase = container.resolve<LoginUsecase>();
  // usecase(em)
}
