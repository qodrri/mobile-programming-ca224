import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/contracts/abs_auth_repository.dart';
import '../../repositories/contracts/abs_moment_repository.dart';
import '../../repositories/databases/db_moment_repository.dart';

import '../../repositories/api/api_auth_repository.dart';

final repositoryProvider = [
  RepositoryProvider<AbsAuthRepository>(
    create: (context) => ApiAuthRepository(),
  ),
  RepositoryProvider<AbsMomentRepository>(
    create: (context) => DbMomentRepository(),
  ),
];
