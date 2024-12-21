import 'package:myapp/models/moment.dart';

import 'package:myapp/models/user.dart';

import '../contracts/abs_api_user_data_repository.dart';

class ApiUserDataRepository extends AbsApiUserDataRepository {
  @override
  Future<bool> follow(String userId) {
    // TODO: implement follow
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getFollowers([String keyword = '']) {
    // TODO: implement getFollowers
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getFollowing([String keyword = '']) {
    // TODO: implement getFollowing
    throw UnimplementedError();
  }

  @override
  Future<List<Moment>> getMoments([String keyword = '']) {
    // TODO: implement getMoments
    throw UnimplementedError();
  }

  @override
  Future<bool> unfollow(String userId) {
    // TODO: implement unfollow
    throw UnimplementedError();
  }
}
