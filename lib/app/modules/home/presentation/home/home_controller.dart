import 'package:flutter_clean_arch/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/usecases/get_users_usecase.dart';

final $HomeController = Bind.singleton(
  (i) => HomeController(i()),
);

class HomeController {
  HomeController(this._getUsersUseCase);

  final GetUsersUseCase _getUsersUseCase;

  List<UserDto> contacts = [];

  Future<void> getData() async {
    var res = await _getUsersUseCase();

    if (!res.success) {
      contacts = [];
      print(res.message);
      return;
    }

    contacts = res.body;
  }
}
