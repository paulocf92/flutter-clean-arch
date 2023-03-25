import 'package:flutter_modular/flutter_modular.dart';

import 'data/repositories/get_users_repository_impl.dart';
import 'external/datasources/get_users_datasource_impl.dart';
import 'presentation/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    $GetUsersDataSourceImpl,
    $GetUsersRepositoryImpl,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
