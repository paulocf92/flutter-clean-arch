import 'package:flutter_clean_arch/app/modules/home/domain/repositories/get_users_repository.dart';
import 'package:flutter_clean_arch/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'get_users_usecase.dart';

final $GetUsersUseCaseImpl = Bind.singleton(
  (i) => GetUsersUseCaseImpl(i()),
);

class GetUsersUseCaseImpl implements GetUsersUseCase {
  GetUsersUseCaseImpl(this._getUsersRepository);

  final GetUsersRepository _getUsersRepository;

  @override
  Future<ResponsePresentation> call() async {
    try {
      var res =
          await _getUsersRepository(); // Run the method 'call' from GetUsersRepository
      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
