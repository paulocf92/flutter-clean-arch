import 'package:flutter_clean_arch/app/modules/home/data/repositories/add_user_repository_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/data/repositories/delete_user_repository_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/data/repositories/update_user_repository_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:flutter_clean_arch/app/modules/home/domain/usecases/add_user_usecase_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/domain/usecases/delete_user_usecase_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/domain/usecases/update_user_usecase_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/external/datasources/add_user_datasource_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/external/datasources/delete_user_datasource_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/external/datasources/update_user_datasource_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/presentation/add/add_controller.dart';
import 'package:flutter_clean_arch/app/modules/home/presentation/add/add_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'external/datasources/get_users_datasource_impl.dart';
import 'data/repositories/get_users_repository_impl.dart';
import 'domain/usecases/get_users_usecase_impl.dart';
import 'presentation/home/home_page.dart';
import 'presentation/home/home_controller.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // DataSources
    $GetUsersDataSourceImpl,
    $AddUserDataSourceImpl,
    $DeleteUserDataSourceImpl,
    $UpdateUserDataSourceImpl,

    // Repositories
    $GetUsersRepositoryImpl,
    $AddUserRepositoryImpl,
    $DeleteUserRepositoryImpl,
    $UpdateUserRepositoryImpl,

    // Use Cases
    $GetUsersUseCaseImpl,
    $AddUserUseCaseImpl,
    $DeleteUserUseCaseImpl,
    $UpdateUserUseCaseImpl,

    // Controllers
    $HomeController,
    $AddController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/add',
        child: (_, args) => AddPage(userDto: args.data as UserDto)),
  ];
}
