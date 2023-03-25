import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_clean_arch/app/modules/home/external/datasources/get_users_datasource_impl.dart';
import 'modules/home/data/repositories/get_users_repository_impl.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    $GetUsersDataSourceImpl,
    $GetUsersRepositoryImpl,
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
  ];
}
