import 'package:flutter_clean_arch/app/modules/home/domain/models/dtos/user_dto.dart';

abstract class UpdateUserRepository {
  Future<UserDto> call(UserDto dto);
}
