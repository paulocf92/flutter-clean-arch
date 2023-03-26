import 'package:flutter_clean_arch/app/modules/home/data/repositories/get_users_repository_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:flutter_clean_arch/app/modules/home/domain/usecases/get_users_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_clean_arch/app/modules/home/data/datasources/get_users_datasource.dart';
import 'get_users_mock.dart';
import 'get_users_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetUsersDataSource>()])
void main() {
  final _getUsersDataSource = MockGetUsersDataSource();
  final _getUsersRepositoryImpl = GetUsersRepositoryImpl(_getUsersDataSource);
  final _getUsersUseCaseImpl = GetUsersUseCaseImpl(_getUsersRepositoryImpl);

  test('testar se foi sucesso na requisição', () async {
    when(_getUsersDataSource()).thenAnswer((_) async => mock);

    var res = await _getUsersUseCaseImpl();

    expect(res.success, isTrue);
    expect(res.body, isA<List<UserDto>>());
  });

  test('testar se não foi sucesso na requisição', () async {
    when(_getUsersDataSource()).thenThrow(Exception('Error'));

    var res = await _getUsersUseCaseImpl();

    expect(res.success, isFalse);
    expect(res.body, isNull);
    expect(res.message, isA<String>());
  });
}
