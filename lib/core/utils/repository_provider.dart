import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/repositories/contracts/abs_moment_repository.dart';
import 'package:myapp/repositories/databases/db_moment_repository.dart';

final repositoryProvider = [
  RepositoryProvider<AbsMomentRepository>(
    create: (context) => DbMomentRepository(),
  ),
];
