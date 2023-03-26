import 'package:flutter_clean_arch/app/modules/home/data/repositories/add_user_repository_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/domain/usecases/add_user_usecase_impl.dart';
import 'package:flutter_clean_arch/app/modules/home/external/datasources/add_user_datasource_impl.dart';
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

    // Repositories
    $GetUsersRepositoryImpl,
    $AddUserRepositoryImpl,

    // Use Cases
    $GetUsersUseCaseImpl,
    $AddUserUseCaseImpl,

    // Controllers
    $HomeController,
    $AddController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/add', child: (_, args) => const AddPage()),
  ];
}
