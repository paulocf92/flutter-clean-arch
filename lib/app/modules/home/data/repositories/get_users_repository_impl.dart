import 'package:flutter_clean_arch/app/modules/home/data/datasources/get_users_datasource.dart';
import 'package:flutter_clean_arch/app/modules/home/domain/models/dtos/user_dto.dart';

import '../../domain/repositories/get_users_repository.dart';

class GetUsersRepositoryImpl implements GetUsersRepository {
  GetUsersRepositoryImpl(this._getUsersDataSource);

  final GetUsersDataSource _getUsersDataSource;

  @override
  Future<UserDto> call() async {
    try {
      var res = await _getUsersDataSource();
      return UserDto.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }
}
